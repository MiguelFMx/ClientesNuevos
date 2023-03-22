
NProgress.start();

$(function () {
        NProgress.done();
        NProgress.remove();
    //===============================Boton registro
    $('#btnRegistrarC').click(function () {
        $('#ErrorContacto').hide();
        $('#ErrorPuesto').hide();
        $('#ErrorCorreo').hide();
        $('#ErrorNumero').hide();

        let rfc = $('#MainContent_ddSocios option:selected').val();
        var nombre = $('#MainContent_txtNombreC');
        var puesto = $('#MainContent_txtPuestoC');
        var mail = $('#MainContent_txtCorreoC');
        var tel = $('#MainContent_txtTelC');
        var cel = $('#MainContent_txtCelC');
        var ext = $('#MainContent_txtExt');
        var tipo = '';
        if ($('#MainContent_chFactura').is(':checked')) {
            tipo = 'Fra'
        } else {
            tipo = 'Comp'
        }

        if (nombre.val() != '' && puesto.val() != '' && mail.val() != '') {
            // alert('No hay error');
            if ((tel.val() != '' && cel.val() == '') || (tel.val() == '' && cel.val() != '') || (tel.val() != '' && cel.val() != '')) {

                swal.fire({
                    showConfirmButton: false,
                    title: 'Registro en proceso',
                    allowOutsideClick: false,
                    willOpen: () => {
                        Swal.showLoading()
                        $.ajax({
                            type: "POST",
                            url: "wsConsultas.asmx/RegistrarContacto",
                            data: "{id:'" + rfc + "'," +
                                "nombre:'" + nombre.val() + "'," +
                                "puesto:'" + puesto.val() + "'," +
                                "mail:'" + mail.val() + "'," +
                                "tipo:'" + tipo + "'," +
                                "tel:'" + tel.val() + "'," +
                                "ext:'" + ext.val() + "'," +
                                "cel:'" + cel.val() + "'}",
                            dataType: "json",
                            async: false,
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                swal.fire({
                                    title: 'Exito!',
                                    text: result.d,
                                    icon: 'success',
                                    timer: 3000
                                }).then((res) => {
                                    document.location.reload();
                                })

                            },
                            failure: function (XMLHttpRequest, textStatus, errorThrown) {
                                if (errorThrown !== "") {
                                    alert("Error en Post: " + errorThrown);
                                }
                            }
                        });
                    }
                });
                console.log('listo');
            } else {
                $('#ErrorNumero').show();
            }
        } else {
            //manejo de mensaje de error
            if (nombre.val() == '') {
                $('#ErrorContacto').show();
            }

            if (puesto.val() == '') {
                $('#ErrorPuesto').show();
            }
            if (mail.val() == '') {
                $('#ErrorCorreo').show();
            }
            if (tel.val() == '' || cel.val()) {
                $('#ErrorNumero').show();

            }
        }
    });

    //===============================Modal
    const myModalEl = document.getElementById('ResgitrarContacto')
    myModalEl.addEventListener('hidden.bs.modal', event => {

        $('#MainContent_txtNombreC').val('');
        $('#MainContent_txtPuestoC').val('');
        $('#MainContent_txtCorreoC').val('');
        $('#MainContent_txtTelC').val('');
        $('#MainContent_txtCelC').val('');
        $('#MainContent_txtExt').val('');

        $('#registro').show();
        $('#edicion').hide();
        $('#RegistrolLabel').html('Registrar contacto');


    })

    const ModalCorreo = document.getElementById('CrearCorreo')
    ModalCorreo.addEventListener('hidden.bs.modal', event => {

        $('#MainContent_txtPara').val('');
        $('#MainContent_txtAsunto').val('');
        $('#MainContent_txtMensaje').val('');

    });


    $('#btnSendAll').click(function () {

        var mails = $('#MainContent_txtPara').val().trimEnd();      
        var asunto = $('#MainContent_txtAsunto').val();
        var cuerpo = $('#MainContent_txtMensaje').val();
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
});

