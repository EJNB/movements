$(document).ready(function () {

    PNotify.prototype.options.styling = "bootstrap3";

    //inicia todos los radios y checkbox
    initiCheck();

    $('.link-tooltip').tooltip();

    //pasar el data-url para el enlace del modal
    $('.link-eliminar').click(function(){
        var description = 'Estas seguro de eliminar este registro',
            url = $(this).attr('data-url');
        $('.modal-body')
                .children('p')
                .html(description)
                .end()
            .find('a.btn').attr('href',url);
        ;
    });

    $('[data-toggle="popover"]').mouseout(function () {
        $(this).popover('hide');
    });

    $('[data-toggle="popover"]').mouseenter(function () {
        $(this).popover('show');
    });

    $('#addEquipment').on('hidden.bs.modal',function (event) {
        $("select#types").selectpicker('val','');
        $("select#brands").selectpicker('val','');
        $("#model").val('');
    });

    //configuracion del campo date de las incidencias
    $('#appbundle_equipment_createAt').datetimepicker({
        useCurrent: false,
        format: 'YYYY-MM-DD',
        locale: 'es',
        showClear: true,
        maxDate : new Date(),
    });

    //configuracion del campo date de las incidencias
    $('#appbundle_me_date').datetimepicker({
        defaultDate : new Date(),
        useCurrent: false,
        format: 'YYYY-MM-DD',
        locale: 'es',
        showClear: true,
        maxDate : new Date(),
    });

    $('.radio_generate_ni').on('ifClicked',function(){
        toogleInputs($(this).val());
    });

});//end $(document).ready

//get All Brand by types
function getAllBrandsByType(elem) {
    var loading_awesome = `<i class="fa fa-refresh fa-spin fa-2x fa-fw"></i><span class="sr-only">Loading...</span>`;
    $('select#brands').parent().html(loading_awesome);
    var url_brands_by_type = Routing.generate('brand_index');
    $.post( url_brands_by_type, { type : elem }, function (response) {
        $('div.show_brands').html(response);
        $('div.show_brands').find('select').selectpicker('refresh');
    });
}

function saveModel() {
    //verificar si la marca esta vacia y el input del modelo
    var brand = $('select#brands').val(),
        model = $('input#model').val();
    if (brand==''){
        new PNotify({
            title: '!Error',
            type : 'error',
            text: 'Por favor seleccione la marca'
        });
    }

    if(model==''){
        new PNotify({
            title: '!Error',
            type : 'error',
            text: 'Por favor introdusca el modelo'
        });
    }

    if ( brand!='' && model!=''){
        //envio por ajax
        var url_add_model = Routing.generate('model_new');
        // alert($('.show_models').find("select option:contains('IR1025')").text())
        $.ajax({
            url : url_add_model,
            data : { brand : brand, model : model },
            method : "POST",
            beforeSend : function () {
                $('#addEquipment').modal('hide');
                $('div.sk-cube-grid').removeClass('hidden');
                $('div.block').addClass('modal');
            },
            success : function (response) {
                $('.show_models').html(response);
                $('.show_models').find('select').selectpicker('refresh');
                var text = $('.show_models').find("select option:contains('"+model+"')").text();
                $('.show_models').find('select').selectpicker('val',$('.show_models').find("select option:contains('"+model+"')").val());
                $('.show_models').find('select').selectpicker('refresh');
                $('div.block').removeClass('modal');
                $('div.sk-cube-grid').addClass('hidden');
            },
            error : function () {
                new PNotify({
                    title: '!Error',
                    type : 'error',
                    text: 'Este modelo ya exite'
                });

                $('div.block').removeClass('modal');
                $('div.sk-cube-grid').addClass('hidden');
            }
        });

    }
}

// //get all models by brand
// function getAllModelsByBrand(elem) {
//     $('div.sk-cube-grid').removeClass('hidden');
//     $('div.block').addClass('modal');
//     var url_models_by_brand = Routing.generate('model_index');
//     $.post( url_models_by_brand, { brand : elem }, function (response) {
//         $('div.show_models').html(response);
//         $('div.show_models').find('select').selectpicker('refresh');
//         $('div.block').removeClass('modal');
//         $('div.sk-cube-grid').addClass('hidden');
//     });
// }

//genera todos los inputs para q se introduscan los numeros de inv dada una cantidad
function toogleInputs(value){
    var inputnins = `
        <div class="form-group">
            <label class="col-sm-3 control-label"></label>
            <div class="col-sm-2">
                <input required type="text" class="form-control" placeholder="Introdusca el N. Inv" name="ni[]"/>
            </div>
            <div class="col-sm-3">
                <input required type="text" class="form-control" placeholder="Introdusca el N. Ser " name="ns[]"/>
            </div>
        </div>`,
        cant =  $('input.cantidad').val();
    $('.show_inputs_ni_ns').html('');

    //verifico si la manera de generar los ni es aleatoria(1) o consecutivo(2)
    if (value==1){//aleatoria
        for(var i=0; i<cant;i++){
            $('.show_inputs_ni_ns').append(inputnins);
        }
    }else{//consecutiva si es consecutivo dispara un modal para q inserte el ni inicial y borrara los input generados aleatoriamente
        $('#firstNI').modal('show');
    }
}

//esta funcion me genera todos los inputs con los ni a partir de un numero inicial
function toogleInputNiConsecutive(elem) {
    if (!elem.value){
        new PNotify({
            title: '!Error',
            type : 'error',
            text: 'Por favor introdusca el numero de inventario inicial'
        });
    }else{
        $('#firstNI').modal('hide');
        var ni_star = elem.value, cont = elem.value,cant =  $('input.cantidad').val();
        $(elem).val('');

        for(var i=0; i<cant;i++){
            $('.show_inputs_ni_ns').append(`
            <div class="form-group">
                <label class="col-sm-3 control-label"></label>
                <div class="col-sm-2">
                    <input required="required" type="text" class="form-control ni" placeholder="Introdusca el N. Inv" value="${cont}" name="ni[]"/>
                </div>
                <div class="col-sm-3">
                    <input required="required" type="text" class="form-control" placeholder="Introdusca el N. Ser " name="ns[]"/>
                </div>
            </div>
        `);
            cont++;
        }
    }
}

//inicia todos los radios y checkbox
function initiCheck() {
    $('.icheck').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' // optional
    });
}

//fnc para una vez q seleccione la instalacion, seleccionar las personas correspondientes a la misma
// y seleccionar los equipos q tengan en alguna disribucion
function selectEquipmentByDistributionPerHotel(elem) {
    // alert(elem)
    // $('div.sk-cube-grid').removeClass('hidden');
    // $('div.block').addClass('modal');
    // var url = Routing.generate('me_new');
    // $.post( url, { hotel : elem }, function (response) {
    //     $('div.show-persons').html(response).find('select').selectpicker('refresh');
    //     $('div.block').removeClass('modal');
    //     $('div.sk-cube-grid').addClass('hidden');
    // })
}
// $.when(showPersonsByHotelAjax()).done(function selectEquipmentsByHotelAjax(elem) {
//     alert()
// });


