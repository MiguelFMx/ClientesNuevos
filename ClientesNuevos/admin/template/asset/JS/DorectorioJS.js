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

        if (asunto != '' && cuerpo != '' && mail.length >=1) {
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
            if (mail.length < 1) {
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
            tipo='Comp'
        }

        if ( nombre.val() != '' && puesto.val() != '' && mail.val() != '' ) {
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
                                "nombre:'" + nombre.val() +"',"+
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
                                    timer:3000
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

    $(document).on('click', '#btnEdit', function(){
        let id = $(this).closest('tr').find('.id').text();
        let comp = $(this).closest('tr').find('.comp').text();
        let contacto = $(this).closest('tr').find('.contacto').text();
        let puesto = $(this).closest('tr').find('.puesto').text(); 
        let correo = $(this).closest('tr').find('.correo').text(); 
        let ext = $(this).closest('tr').find('.ext').text(); 
        let celular = $(this).closest('tr').find('.celular').text(); 
        let tipo = $(this).closest('tr').find('.tipo').text();
        let telefono = $(this).closest('tr').find('.telefono').text();

        //cambios a modal
        $('#registro').hide();
        $('#edicion').show();
        $('#RegistrolLabel').html('Editar contacto');
        document.getElementById('MainContent_ddSocios').value = comp;
        $('#MainContent_txtNombreC').val(contacto);
        $('#MainContent_txtPuestoC').val(puesto);
        $('#MainContent_txtCorreoC').val(correo);
        $('#MainContent_txtTelC').val(telefono)
        $('#MainContent_txtExt').val(ext);
        $('#MainContent_txtCelC').val(celular);
        $('#MainContent_hfID').val(id);
        switch (tipo) {
            case 'Facturacion':
                $('#MainContent_chFactura').prop('checked', true);
                break;
            case 'Compañia':
                $('#MainContent_chFactura').prop('checked', false);
                break;
            default:
                $('#MainContent_chFactura').prop('checked', false);
                break;
        }

    });

    $('#btnEditarContacto').click(function () {
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
        var index = $('#MainContent_hfID');
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
                            url: "wsConsultas.asmx/EditarContacto",
                            data: "{rfc:'" + rfc + "'," +
                                "nombre:'" + nombre.val() + "'," +
                                "puesto:'" + puesto.val() + "'," +
                                "mail:'" + mail.val() + "'," +
                                "tipo:'" + tipo + "'," +
                                "tel:'" + tel.val() + "'," +
                                "ext:'" + ext.val() + "'," +
                                "id:'" + index.val() + "'," +
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

    $('#btnEliminarContacto').click(function () {
        var id = $('#MainContent_hfID').val();

        Swal.fire({

            text: "¿Está seguro de que desea eliminar este contacto de forma permanente?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                //SI
                swal.fire({
                    showConfirmButton: false,
                    title: 'Eliminando registro',
                    allowOutsideClick: false,
                    willOpen: () => {
                        Swal.showLoading()
                        $.ajax({
                            type: "POST",
                            url: "wsConsultas.asmx/BorrarContacto",
                            data: "{id:'" + id + "'}",
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
                        //--------
                    }
                })

            }
        })
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
                    "<td style='display:none;'><span class='id'>" + lstTabla[i].ID+"</span></td>"+
                    "<td>" + lstTabla[i].Nombre_comercial + "<br><small><span class='comp'>" + lstTabla[i].ID_compania + "</span></small></td>" +
                    "<td><span class='contacto'>" + lstTabla[i].Nombre + "</span><br><small><span class='puesto'>" + lstTabla[i].Puesto + "</span></small></td>" +
                    "<td><span class='correo'>" + lstTabla[i].Correo + "</span></td>" +
                    "<td><span class='telefono'>" + lstTabla[i].Telefono + "</span></td>" +
                    "<td><span class='ext'>" + lstTabla[i].Extension + "</span></td>" +
                    "<td><span class='celular'>" + lstTabla[i].Celular + "</span></td>" +
                    "<td><span class='tipo'>" + tipo +"</span></td>" +
                    "<td>" +
                    "<button id='btnMensaje' type='button' name='correo' class='btn btn-secondary btn-sm me-1' data-bs-toggle='modal' data-bs-target='#CorreoIndividual' data-bs-whatever='" + lstTabla[i].Correo + ";" + lstTabla[i].Nombre + "'><i class='bi bi-envelope'></i></button>" +
                    "<button id='btnEdit' type='button' name='Editar' class='btn btn-warning btn-sm text-white' data-bs-toggle='modal' data-bs-target='#ResgitrarContacto'><i class='bi bi-pencil-square' ></i></button>" +
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