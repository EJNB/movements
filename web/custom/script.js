$(document).ready(function () {

    PNotify.prototype.options.styling = "bootstrap3";

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

    //envio por ajax cuando selecciono el tipo
    $('select.types').on('changed.bs.select',function (event) {

        $('div.sk-cube-grid').removeClass('hidden');
        $('div.block').addClass('modal');

        $.ajax({
            url : Routing.generate('brand_index'),
            method : 'POST',
            data : { 'type' : $(this).val()},
            success : function (response) {
                $('div.show_brands').html(response);
                $('div.show_brands').find('select').selectpicker('refresh');
                $('div.block').removeClass('modal');
                $('div.sk-cube-grid').addClass('hidden');
            },
            error : function () {
                alert('error');
            }
        });//end ajax method
    });//end type change
});

//get All Brand by types
function getAllBrandsByType(elem) {
    $('div.sk-cube-grid').removeClass('hidden');
    $('div.block').addClass('modal');
    var url_brands_by_type = Routing.generate('brand_index');
    $.post( url_brands_by_type, { type : elem }, function (response) {
        $('div.show_brands').html(response);
        $('div.show_brands').find('select').selectpicker('refresh');
        $('div.block').removeClass('modal');
        $('div.sk-cube-grid').addClass('hidden');
    });
}

//get all models by brand
function getAllModelsByBrand(elem) {
    $('div.sk-cube-grid').removeClass('hidden');
    $('div.block').addClass('modal');
    var url_models_by_brand = Routing.generate('model_index');
    $.post( url_models_by_brand, { brand : elem }, function (response) {
        $('div.show_models').html(response);
        $('div.show_models').find('select').selectpicker('refresh');
        $('div.block').removeClass('modal');
        $('div.sk-cube-grid').addClass('hidden');
    });
}
//