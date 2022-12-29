/// <reference path="../../../../scripts/js/ajax.js" />
/// <reference path="../../../../scripts/sweetalert2.all.min.js" />

NProgress.start();

$(document).ready(function () {
    const CorreoIndividual = document.getElementById('CorreoIndividual')
    CorreoIndividual.addEventListener('show.bs.modal', event => {
        // Button that triggered the modal
        const button = event.relatedTarget
        // Extract info from data-bs-* attributes
        const recipient = button.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        const modalCorreo = CorreoIndividual.querySelector('#txtCorreo');
        const modalRemitente = CorreoIndividual.querySelector('#txtRemitente');
        const datos = `${recipient}`;
        const correo = datos.split(";");

        modalCorreo.value = correo[0];
        modalRemitente.value = correo[1];
    });

    //string correo, string remitente, string subject, string cuerpo
    $('#btnSend').click(function () {
        var correo = $('#txtCorreo').val();
        var remitente = $('#txtRemitente').val();
        var subject = $('#txtAsunto').val();
        var cuerpo = $('#txtCuerpo').val();
        if (subject != '' && cuerpo != '') {
            swal.fire({
                showConfirmButton: false,
                title: 'Enviando correo',
                allowOutsideClick: false,
                showSpinner: true,
                willOpen: () => {
                    Swal.showLoading()
                    $.ajax({
                        type: "POST",
                        url: "../wsAdminIndex.asmx/EnviarCorreo",
                        data: {
                            'correo': correo,
                            'remitente': remitente,
                            'subject': subject,
                            'cuerpo': cuerpo
                        },

                        cache: false,
                        success: function (response) {
                            swal.fire({
                                title: 'Exito!',
                                text: 'Correo enviado a ' + correo,
                                icon: 'success'
                            })
                        },
                        failure: function (response) {
                            swal.fire(
                                "Error interno",
                                "", 
                                "error"
                            )
                        }
                    });
                }
            });
        } else {
            swal.fire(
                "Error ",
                "Falta de datos", // had a missing comma
                "error"
            )
        }
     
    });

    $('#btnSendAll').click(function () {
        
        var mail = new Array();
        var remitente = new Array();

        var asunto = $('#txtAsuntoAll').val();
        var cuerpo = $('#txtBody').val();

        $('.form-check').each(function () {
            let checked = $(this).find($('[name=check]'));
            let mailTemp = $(this).find($('[name=correo]'));
            let contactTemp = $(this).find($('[name=contacto]'));
            if (checked.is(":checked")) {
                //Correo.push(mail.text() + ";" + contact.text());
                mail.push(mailTemp.text());
                remitente.push(contactTemp.text());
            }
        });

        if (asunto != '' && cuerpo != '' && mail.length > 1) {
                swal.fire({
                showConfirmButton: false,
                title: 'Enviando correo',
                allowOutsideClick: false,
                willOpen: () => {
                    Swal.showLoading()
                    $.ajax({
                        type: "POST",
                        url: "../wsAdminIndex.asmx/EnviarMultiplesCorreos",
                        data:
                            JSON.stringify({ correo: mail, remitente: remitente, subject: asunto, cuerpo: cuerpo }),
                        contentType: "application/json; charset=utf-8",
                        success: function (result) {
                            swal.fire({
                                title: 'Exito!',
                                text: result.d,
                                icon: 'success'
                            })
                            console.log(result.d)
                        },
                        failure: function () {
                            swal.fire(
                                "Error interno",
                                "D:", // 
                                "error"
                            )
                            alert('Hay un error')
                        }
                    });
                }
            });
                
           
        } else {
            if (mail.length == 0) {
                swal.fire(
                    "Error",
                    "Falta de datos:Seleccione al menos un correo", 
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


    $('#btnRegistrarC').click(function () {
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
            tipo='Comp'
        }

        if (nombre != '' || puesto != '' || mail != '' ) {
           // alert('No hay error');
            if ((tel != '' && cel == '') || (tel == '' && cel != '') || (tel != '' && cel != '')) {
         
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
                                "nombre:'" + nombre.val() +"',"+
                                "puesto:'" + puesto.val() + "'," +
                                "mail:'" + mail.val() + "'," +
                                "tipo:'" + tipo.val() + "'," +
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
                                    icon: 'success'
                                })
                                console.log(result.d);
                                nombre.val('');
                                puesto.val('');
                                mail.val('');
                                tipo.val('');
                                tel.val('');
                                ext.val('');
                                cel.val('');
                            },
                            failure: function (XMLHttpRequest, textStatus, errorThrown) {
                                if (errorThrown !== "") {
                                    alert("Error en Post: " + errorThrown);
                                }
                            }
                        });
                    }
                });
            } else {
                $('#ErrorNumero').show();
            }
        } else {
            //manejo de mensaje de error
            if (nombre == '') {
                $('#ErrorContacto').show();
            } 

            if (puesto == '') {
                $('#ErrorPuesto').show();
            } 
            if (mail == '') {
                $('#ErrorCorreo').show();
            } 
        }

        //Quitar mensaje se escribe algo


    });


    ObtenerContacto();

    CargarDirectorio();

    var table = $('#tDirectorio').DataTable();
    var tdir = $('#tDir').DataTable();


    NProgress.done();
    NProgress.remove();

});

function ObtenerContacto() {
    var tbl = $('#tDirectorio tbody');
    GetAjax("wsConsultas.asmx/GetContactos", "", false, function (lstTabla) {
        if (lstTabla.length > 0) {
            tbl.empty();
            for (var i = 0; i < lstTabla.length; i++) {
                var tipo;
                switch (lstTabla[i].Tipo) {
                    case 'Fra':
                        tipo = 'Facturacion';
                        break;
                    case 'Comp':
                        tipo = 'Compañia';
                        break;
                    case 'AAMX':
                        tipo = 'Agente aduanal mexicano';
                        break;
                    case 'AAUSA':
                        tipo = 'Agente aduanal americano';
                        break;
                }
                if (lstTabla[i].Correo != '') { 
                tbl.append(
                    "<tr>" +
                    "<td>" + lstTabla[i].Nombre_comercial+"<br><small>"+ lstTabla[i].ID_compania + "</small></td>" +
                    //"<td>" + lstTabla[i].Nombre_comercial + "</td>" +
                    "<td>" + lstTabla[i].Nombre + "<br><small>" + lstTabla[i].Puesto + "</small></td>" +
                    "<td>" + lstTabla[i].Correo + "</td>" +
                    "<td>" + lstTabla[i].Telefono + "</td>" +
                    "<td>" + lstTabla[i].Extension + "</td>" +
                    "<td>" + lstTabla[i].Celular + "</td>" +
                    "<td>" + tipo +"</td>" +
                    "<td>" +
                    "<button id='btnMensaje' type='button' name='correo' class='btn btn-secondary btn-sm me-1' data-bs-toggle='modal' data-bs-target='#CorreoIndividual' data-bs-whatever='" + lstTabla[i].Correo + ";" + lstTabla[i].Nombre + "'><i class='bi bi-envelope'></i></button>" +
                    "<button id='btnEdit' type='button' name='Editar' class='btn btn-warning btn-sm text-white'><i class='bi bi-pencil-square'></i></button>" +

                    "</td>" +
                    "</tr>"
                    );
                }
            }
        }
    });
}


function CargarDirectorio() {
    var directorio = $('#Directorio')
    GetAjax("wsConsultas.asmx/GetContactos", "", false, function (lstTabla) {
        if (lstTabla.length > 0) {
            directorio.html("");
            $('#tDir tbody').empty();
            for (var i = 0; i < lstTabla.length; i++) {
                var tipo;
                switch (lstTabla[i].Tipo) {
                    case 'Fra':
                        tipo = 'Facturacion';
                        break;
                    case 'Comp':
                        tipo = 'Compañia';
                        break;
                    case 'AAMX':
                        tipo = 'Agente aduanal mexicano';
                        break;
                    case 'AAUSA':
                        tipo = 'Agente aduanal americano';
                        break;
                }
                if (lstTabla[i].Correo !='') {
     $('#tDir tbody').append(
                    "<tr>" +
                    "<td>" +
                    "<div class='row'>" +
                    "<div class='col'>" +
                    "<div class='form-check'>" +
                    "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                    "<label class='form-check-label' for='flexCheckDefault'>" +
                    "<span><label name='contacto'>" + lstTabla[i].Nombre + "</label> (" + lstTabla[i].Puesto + ")<br>" +
                    "<small><label name='correo'>" + lstTabla[i].Correo + "</label></small><br>" +
                    "<small>" + tipo + "</small><br><small>" + lstTabla[i].Nombre_comercial + "</small>" +
                    "</span>" +
                    "</label>" +
                    "</div>" +
                    "</div>" +
                    "</td>" +
                    "</tr>"
                )
                }
            }
        }
    });
}