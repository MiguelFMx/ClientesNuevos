/// <reference path="../../scripts/js/ajax.js" />
/// <reference path="../../scripts/jquery-3.6.0.min.js" />

$(document).ready(function () {

    $('#btnContactoCompañia').click(function () {

        //tContactoCom
        var nombre = $('#txtNombrCont');
        var puesto = $('#txtpuestoCont');
        var correo = $('#txtCorreoCont');
        var ext = $('#txtExtCont');
        var tel = $('#txtTelCont');
        var cel = $('#txtCelCont');

        var tabla = $('#tContactoCom tbody');

        tabla.append(
            "<tr>" +
            "<td><span>" + nombre.val() + "</span></td>" +
            "<td><span>" + puesto.val() + "</span></td>" +
            "<td><span>" + correo.val() + "</span></td>" +
            "<td><span>" + ext.val() + "</span></td>" +
            "<td><span>" + tel.val() + "</span></td>" +
            "<td><span>" + cel.val() + "</span></td>" +
            "<td><button type='button'class='btn btn-danger' name='remove' id='remove' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>"+
            "</tr>"
        );
        nombre.val(""); puesto.val(""); correo.val(""); ext.val("");tel.val(""); cel.val("");

        nombre.focus();

    });
    $(document).on('click', '#remove', function () {
       
        $(this).parent().closest("tr").remove();
    });

});

