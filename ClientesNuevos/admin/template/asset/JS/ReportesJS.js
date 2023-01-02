/// <reference path="../../../../scripts/datatables/datatables.min.js" />

$(document).ready(function () {
    ObtenerCorreosOP();

    var tabla = $('#tCorreos').DataTable();

    var tabla2 = $('#tCorreosSinOP').DataTable();

    $('#btnEnviarCorreo').click(function () {
        var txtAsunto = $('#MainContent_txtAsunto');
        var txtMensaje = $('#MainContent_txtMensaje');
        var correo = [];
        var email = [];


        if (txtAsunto.val() == '' || txtMensaje.val() == '') {
            alert('Llene los campos');
        } else {
            $('.form-check').each(function () {
                let checked = $(this).find($('[name=check]'));
                let mailTemp = $(this).find($('[name=correo]'));
                let contactTemp = $(this).find($('[name=contacto]'));

                if (checked.is(':checked')) {
                    correo.push(mailTemp.html() + ';' + contactTemp.html());
                }
            });

            $.ajax({
                type: "POST",
                url: "wsReportes.asmx/EnviarCorreos",
                data: JSON.stringify({ Info: correo, asunto: txtAsunto.val(), cuerpo: txtMensaje.val() }),
                dataType: "json",
                async: false,
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    swal.fire({
                        text: result.d,
                        icon: 'success',
                        timer: 3000
                    }).then((res) => {
                        //document.location.reload();
                        $('.form-check').each(function () {
                            let checked = $(this).find($('[name=check]'));
                            
                            if (checked.is(':checked')) {
                                checked.prop('checked', false);
                            }
                        });
                    })

                },
                failure: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (errorThrown !== "") {
                        alert("Error en Post: " + errorThrown);
                    }
                }
            });
        }
        console.log(correo);
    });

});


function ObtenerCorreosOP() {
    //GetCorreosOP
    var tabla = $('tCorreos tbody');

    GetAjax("wsReportes.asmx/GetCorreosOP", "", false, function (correo) {
        if (correo.length > 0) {
            tabla.empty;
            for (var i = 0; i < correo.length; i++) {
                if (correo[i].OP == 'si') {
                    console.log(correo[i].Nombre);
                    $('#tCorreos tbody').append(
                        "<tr>" +
                        "<td>" +
                        "<div class='row'>" +
                        "<div class='col'>" +
                        "<div class='form-check'>" +
                        "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                        "<label class='form-check-label' for='flexCheckDefault'>" +
                        "<span><label name='contacto'>" + correo[i].Nombre + "</label> (" + correo[i].Puesto + ")<br>" +
                        "<small><label name='correo'>" + correo[i].Correo + "</label></small><br>" +
                        //"<small>" + tipo + "</small><br><small>" + correo[i].Nombre_comercial + "</small>" +
                        "</span>" +
                        "</label>" +
                        "</div>" +
                        "</div>" +
                        "</td>" +
                        "</tr>"
                    );
                } else {
                    console.log(correo[i].Nombre);
                    $('#tCorreosSinOP tbody').append(
                        "<tr>" +
                        "<td>" +
                        "<div class='row'>" +
                        "<div class='col'>" +
                        "<div class='form-check'>" +
                        "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                        "<label class='form-check-label' for='flexCheckDefault'>" +
                        "<span><label name='contacto'>" + correo[i].Nombre + "</label> (" + correo[i].Puesto + ")<br>" +
                        "<small><label name='correo'>" + correo[i].Correo + "</label></small><br>" +
                        //"<small>" + tipo + "</small><br><small>" + correo[i].Nombre_comercial + "</small>" +
                        "</span>" +
                        "</label>" +
                        "</div>" +
                        "</div>" +
                        "</td>" +
                        "</tr>"
                    );
                }
            }
        }
    });

}