$(document).ready(function () {

    PNotify.prototype.options.styling = "bootstrap3";

    //inicia todos los radios y checkbox
    initiCheck();

//esto es pra cuando clicked en el boton de selectall selecctione todoas las distribuciones
    // $('input.select_all_distribution').click(function () {
    //     if (this.checked){
    //         $('input.subcheckbox').prop('checked',true);
    //         $('.print_selection,.delete_selection').removeClass('hide')//habilitar el boton de imprimir todos
    //         $('.link-tooltip').tooltip('hide');
    //     }else {
    //         $('input.subcheckbox').prop('checked',false);
    //         $('.print_selection,.delete_selection').addClass('hide')//desabilitar el boton de imprimir todos
    //     }
    // });

    // $('span.show-cant').html(0);
    // let cant = $('select.equipments').find('[value="' + $('select.equipments').val() +'"]').attr('data-subtext');
    // $('span.show-cant').html(cant);//muestro la cantidad de equipos
    // if(cant== 0){
    //     $('#appbundle_distributioni_persons').prop('disabled',true);
    //     $('#appbundle_distributioni_persons').selectpicker('refresh');
    // }else{
    //     $('#appbundle_distributioni_persons').prop('disabled',false);
    //     $('#appbundle_distributioni_persons').selectpicker('refresh');
    // }


    if($('.subcheckbox:checked').length>0){
        $('.print_selection,.delete_selection').removeClass('hide')//habilitar el boton de imprimir todos
        $('.link-tooltip').tooltip('hide');
    }else{
        $('.print_selection,.delete_selection').addClass('hide')
    }

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

    //configuracion del campo de las facturas
    $('#appbundle_invoice_date').datetimepicker({
        // useCurrent: false,
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

    //set color de los input de hecho, en proceso y abierto
    $('.change_distribution_state').iCheck({
        checkboxClass: 'icheckbox_square-green',
        increaseArea: '20%' // optional
    });

    $('select.equipments').on('changed.bs.select', function (e) {
        let cant = $('select.equipments').find('[value="' + $(this).val() +'"]').attr('data-subtext'),
            select_persons = $('#appbundle_distributioni_persons');
        $('span.show-cant').html(cant);//ponga la cantidad de equipos en el span

        if(cant== 0){
            select_persons.prop('disabled',true);
            select_persons.selectpicker('refresh');
        }else{
            select_persons.prop('disabled',false);
            select_persons.selectpicker('refresh');
        }

        select_persons.selectpicker({
            maxOptions : cant,
        });
        select_persons.selectpicker('refresh');
    });

    $('#appbundle_distributioni_persons').selectpicker({
        // actionsBox : true, //activar los botones deselectAll y selectAll
        // selectAllText : 'Seleccionar todo', //cambia el mesage del boton selectAll
        // deselectAllText : 'Deseleccionar todo', //cambia el mensage del boton deselectAll
        liveSearch : true, //activar la buscqueda
        liveSearchPlaceholder : 'Buscar',
        // maxOptions : 0,
        maxOptionsText : 'No quedan mas equipos para distribuir',
        noneSelectedText : 'No hay personas seleccionadas',
        title : 'Seleccione las personas',
    })

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

//esta funcion es para eliminar todas las distribuciones externas seleccionadas
function deleteDistributionSeleccion() {
    $('#modal_delete_many_file').modal('hide');
    $('div.block').addClass('modal');
    $('div.sk-cube-grid').removeClass('hidden');
    var distribution_ids_array = [],
        distribution = $('h2.distribution-title').text().indexOf('externas'),
        url = (distribution==-1) ? Routing.generate('delete_many_distribution_i_selection') : Routing.generate('delete_distribution_selection');
    $('input.subcheckbox:checked').each(function () {
        distribution_ids_array.push(Number($(this).attr('data-id')));
    });

    $.post(url, { data : distribution_ids_array }, function(response) {
        $('div.show-distributions-list').html(response);
        $('div.block').removeClass('modal');
        $('div.sk-cube-grid').addClass('hidden');
    });
}

//esta funcion verificara q existan input seleccionados y disparara el modal
function toogleModalConfimDeletedDistributions() {
    //verificar q el dato q se va enviar no este vacio
    if($('.subcheckbox:checked').length>0){
        $('#modal_delete_many_file').modal('show');
    }else {
        new PNotify({
            title: '!Error',
            type : 'error',
            text: 'Por favor seleccione alguna distribution'
        });
    }
}

//esta funcion es para cuando clicked input:check se muestren ls btns de eliminar todo e imprimir selccion
function selectAllDistribucion(elem) {
    if (elem.checked){
        $('input.subcheckbox').prop('checked',true);
        $('.print_selection,.delete_selection').removeClass('hide');//habilitar el boton de imprimir todos
        $('.link-tooltip').tooltip('hide');
    }else {
        $('input.subcheckbox').prop('checked',false);
        $('.print_selection,.delete_selection').addClass('hide')//desabilitar el boton de imprimir todos
    }
}
//esta funcion es pra cuando seleccione distribuciones salteadas se activen los btn de aliminar todo y imprimir seleccion
function showInputsPrintAndRemoveAll(){
    if($('.subcheckbox:checked').length>0){
        $('.print_selection,.delete_selection').removeClass('hide');
    } else {
        $('.print_selection,.delete_selection').addClass('hide')//desabilitar el boton de imprimir todos
    }
}

//cambiar el estado de las distribuciones
function setDistributionStatus(elem) {
    //pongo la animacion pequeña de awesome
    $('div.block').addClass('modal');
    $('div.sk-cube-grid').removeClass('hidden');
    var distribution = $('h2.distribution-title').text().indexOf('externas'),
        url = (distribution==-1) ? Routing.generate('set_distribution_i_status') : Routing.generate('set_distribution_status'),
        id = Number($(elem).attr('data-id')),
        status = $(elem).prop('checked');

    $.post(url,{ data_id : id, data_status : status },function (response) {
        $('.show-distributions-list').html(response);

        //dentengo la animacion
        $('div.block').removeClass('modal');
        $('div.sk-cube-grid').addClass('hidden');

        PNotify.removeAll();//remove all notifications
        //muestro la notificacion
        new PNotify({
            title: 'Exito',
            type : 'success',
            text: 'Sus cambios han sido guardados satisfactoriamente.'
        });
    });
}

//enviar el fichero de la factura adjunto
function sendFileAndShowAnimationLoading(event) {
    event.preventDefault();
    if ($('form#form_upload_file').find('input[type="file"]').val()==''){//si no hay nada el formulario muestro el alert
        PNotify.removeAll();

        new PNotify({
            title: 'Alerta',
            text: 'Por favor seleccione el archivo',
            type: 'warning',
            delay : 2000,
        });
    }else {
        $('form#form_upload_file').submit();
        $('#modal_upload_file').modal('hide');
        //pongo la animacion
        $('div.block').addClass('modal');
        $('div.sk-cube-grid').removeClass('hidden');
    }
}

//setear el action del formu`lario para el envio del documento
function setActionFormUrlUploadFile(elem){
    $('form#form_upload_file').attr('action',$(elem).attr('upload-data-url'));
}

//show invoice's equipment
function showInvoiceDetails(elem) {
    $(elem.target).parent().parent().prev().find('.equipments_collapse').slideToggle('fast');
}

function toogleEquipmentByDistribution(elem) {
    $(elem).next().next().slideToggle('fast');
}

//funcion para evitar q se seleccionen mas personas q equipos
function addPersonToDistribution(elem) {
    alert()

    // console.log($(elem).val().pop());
    // console.log($('select#appbundle_distributioni_persons').find('[value="' + $(elem).val().pop() +'"]'))
    // alert($('select#appbundle_distributioni_persons').find('[value="' + $(elem).val().pop() +'"]').prop('selected'))
    // let cantidad = Number($('span.show-cant').html());//cantidad de equipos
    // if ( cantidad > 0 ){
    //     if ($('select#appbundle_distributioni_persons').find('[value="' + $(elem).val().pop() +'"]').prop('selected')===true){
    //         cantidad = cantidad - 1;
    //     }else {
    //         cantidad = cantidad + 1;
    //     }
    //     $('span.show-cant').html(cantidad);
    // }
    // $('span.show-cant').html(cantidad);
    // alert(cant)
    // $('#appbundle_distributioni_persons option:selected').length;
}
