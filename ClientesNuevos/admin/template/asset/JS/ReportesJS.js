/// <reference path="../../../../scripts/datatables/datatables.min.js" />
/// <reference path="../../../../scripts/sweetalert2.all.min.js" />


$(document).ready(function () {
    ObtenerCorreosOP();

    var tabla = $('#tCorreos').DataTable();

    var tabla2 = $('#tCorreosSinOP').DataTable();

    const ModalCorreo = document.getElementById('CrearCorreo')
    ModalCorreo.addEventListener('hidden.bs.modal', event => {

        $('#MainContent_txtPara').val('');
        $('#MainContent_txtAsuntos').val('');
        $('#MainContent_txtMensajes').val('');

    });

    //Enviar correo
    $('#btnSendAll').click(function () {

        var mails = $('#MainContent_txtPara').val().trimEnd();
        var asunto = $('#MainContent_txtAsuntos').val();
        var cuerpo = $('#MainContent_txtMensajes').val();
        var str = [];
        str = cuerpo.split('\n').join('%0A');

        if (asunto != '' && cuerpo != '' && mails != '') {
            $("#anchorMail").attr("href", "mailto:" + mails + "?subject=" + asunto + "&body=" + str);

            swal.fire({
                title: 'Enviando correo',
                html: 'Su aplicacion de correo se abrira automaticamente',
                icon: 'info'
            }).then((result) => {
                if (result.isConfirmed) {
                    //--cierro modal
                    $('#CrearCorreo').modal('hide');

                    $('#anchorMail')[0].click();

                }
            })
        } else {
            if (mails == '') {
                swal.fire(
                    "Error",
                    "Falta de datos:Seleccione al menos dos correo",
                    "error"
                )
            }
            if (asunto == '' || cuerpo == '') {
                swal.fire(
                    "Error",
                    "Falta de datos para el correo",
                    "error"
                )
            }
        }

    });

    $('#btnEnviarCorreoSinOP').click(function () {
        
        var txtAsunto = $('#MainContent_txtAsuntoSinOP');
        var txtMensaje = $('#MainContent_txtBodySinOP');
        var correo = new Array();
            $('.form-check').each(function () {
                let checked = $(this).find($('[name=check]'));
                let mailTemp = $(this).find($('[name=correo]'));

                if (checked.is(':checked')) {
                    correo.push(mailTemp.html());
                }
            });
        if (correo.length > 0 && txtAsunto.val() != "" && txtMensaje.val() != "") {
            var _listaMail = 'mailto:';
            for (var i = 0; i < correo.length; i++) {
                _listaMail += correo[i] + ";";
            }
            _listaMail = _listaMail.substring(0, _listaMail.length - 1);
            _listaMail += "?subject=" + txtAsunto.val() + "&body=" + txtMensaje.val();

            //Le implemento un cambio de href al boton oculto
            $("#anchorMail").attr("href", _listaMail);

            $("#anchorMail")[0].click();
        } else {

        }
            
       

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
                            "<small>" + correo[i].Compania + "</small>" +
                            "</span>" +
                            "</label>" +
                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>"
                        );
                    } else {
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
                            "<small>" + correo[i].Compania + "</small>" +
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
