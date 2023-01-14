/// <reference path="../../../../scripts/js/ajax.js" />


NProgress.start();

$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));


    var tipo = "";
    const UploadDoc = document.getElementById('UploadDoc');
    if (UploadDoc) {
        UploadDoc.addEventListener('show.bs.modal', event => {
            // Button that triggered the modal
            const button = event.relatedTarget;
            // Extract info from data-bs-* attributes
            const recipient = button.getAttribute('data-bs-type');

            // Update the modal's content.
            const modalTitle = UploadDoc.querySelector('.modal-title');

            modalTitle.textContent = ` ${recipient}`;

            const modalLabel = UploadDoc.querySelector('#lblarchivo');
            modalLabel.textContent = `Seleccione el archivo correspondiente a la ${recipient}`;

            const lblErr = UploadDoc.querySelector('#MainContent_lblErr');
            //lblErr.textContent = `${recipient}`;

            tipo = `${recipient}`;
        });
    }

    //data-bs-type
    var documento = ""
    const CorreoAct = document.getElementById('CorreoAct');
    if (CorreoAct) {
        CorreoAct.addEventListener('show.bs.modal', event => {
            const button = event.relatedTarget;

            const recipient = button.getAttribute('data-bs-type');
            const lblTipo = CorreoAct.querySelector('#MainContent_lblDoc');
            const modalTitle = CorreoAct.querySelector('.modal-title');
            documento = ` ${recipient}`;
            modalTitle.textContent = `Solicitud de actualización de `+ documento.toLowerCase();

            const txtCorreo = CorreoAct.querySelector('#MainContent_txtMensaje');
            txtCorreo.textContent = `El motivo de la presente es para solicitar su apoyo en la recolección de datos de nuestros socios comerciales. Esta información es para completar nuestros archivos de socios de negocio.\r\n\r\nLe solicitamos atentamente su apoyo en actualización de la siguiente documentación: ${recipient} \r\n\r\n Ingrese a clientes.hungaros.com y haga la actualizacion correspondiente`;
            lblTipo.textContent = documento;
        });
    }
    $('#btnReiniciar').click(function () {
        location.reload();
    });

    $('#btnCancelarFile').click(function () {
        limpiar();
    });

    $('#btnPrueba').click(function () {
        guardarDocumento(tipo);
    });

    //EnviarMultiplesCorreos
    $('#btnEnviar').click(function () {
        var mail = new Array();
        var remitente = new Array();

        var asunto = $('#MainContent_txtAsunto').val();
        var cuerpo = $('#MainContent_txtMensaje').val();
        var documento = $('#MainContent_lblDoc').text().trim();
        let urlParams = new URLSearchParams(window.location.search);
        let acomp = urlParams.get('id');

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
                JSON.stringify({ correo: mail, remitente: remitente, subject:asunto, cuerpo:cuerpo }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {

                if (result.length >= 1 && result[0].substring(0,4) != 'Error') {
                    swal.fire({
                        title: 'Exito!',
                        text: result.d,
                        icon: 'success'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            switch (documento) {
                                case '(F-5) Evaluacion de seguridad':
                                    documento = 'F5'
                                    break;
                                case '(F-14) Admision de cliente':
                                    documento = 'F14'
                                    break;
                                case '(F-12) Política de seguridad C-TPAT':
                                    documento = 'F12';
                                    break;
                                case '(F-43) Mapeo de flujo de carga':
                                    documento = 'F43';
                                    break;
                            }

                            GetAjax("../../F14/wsBaseDatos.asmx/Actualizar_Estado", "'ID_compania':'" + acomp + "','Documento':'" + documento + "','Estatus':'act'", false, function (cambio) {
                                //ModalAlert
                                console.log(cambio);
                                location.reload();
                            });
                        }
                    })
                    console.log(result.d)
                } else {
                    swal.fire(
                        "Error interno",
                        "Oh no! "+result.d, // had a missing comma
                        "error"
                    )
                }
            },
            failure: function () {
                swal.fire(
                    "Error interno",
                    "D:", // had a missing comma
                    "error"
                )
            
                alert('Hay un error')
            }
        });

            }
        });

    });

    ObtenerRoles();
    ListaContactos();

    NProgress.done();
    NProgress.remove();
});

function limpiar() {
    $("div").remove(".drop-zone__thumb");
    $("span").remove(".drop-zone__prompt");
    $('#MainContent_inputFile').val("");
    $("#dropzone").append("<span class='drop-zone__prompt'>Suelte el archivo o haga click aqui</span>");
}


function guardarDocumento(tipo) {
    var data = new FormData();
    var id_cuenta = "";

    let searchParams = new URLSearchParams(window.location.search)
    if (searchParams.has('id')) {
        id_cuenta = searchParams.get('id');

        if (tipo == 'Evaluacion In-situ') {
            tipo = 'F16';
        }

        document.querySelectorAll(".drop-zone__input").forEach(inputElement => {

            if (inputElement.files.length) {
                data.append(inputElement.files[0].name, inputElement.files[0])


                swal.fire({
                    showConfirmButton: false,
                    title: 'Subiendo archivo',
                    allowOutsideClick: false,
                    showSpinner: true,
                    willOpen: () => {
                        Swal.showLoading();
                        $.ajax({
                            url: "../../usuario/hFileController.ashx?idcomp=" + id_cuenta + "&desc=" + tipo,
                            type: "POST",
                            data: data,
                            contentType: false,
                            processData: false,
                            success: function (result) {
                                swal.fire({
                                    title: 'Exito!',
                                    text: 'Documento almacenado con exito',
                                    icon: 'success'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location.reload();
                                    }
                                })
                            },
                            error: function (err) {
                                console.log(err.statusText);
                            }
                        });
                    }
                });               
            } else {
                console.log('Seleccione un documento');
                Swal.fire(
                    'Sin documento',
                    'No ha seleccionado un documento',
                    'warning'
                )
                $('#MainContent_lblErr').html('*Seleccione un documento');
            }

        });
    } else {
        console.log("Error: no se detecto ID");
    }

}


function ObtenerRoles() {
    let rfc;
    let rol;
    let dominio;
    let empresa;
    let searchParams = new URLSearchParams(window.location.search)
    if (searchParams.has('id')) {
        rfc = searchParams.get('id');
        //ObtenerRoles_Especifico
        GetAjax("../usuarios/wsUsuarios.asmx/ObtenerRoles_Especifico", "'id':'" + rfc + "'", false, function (lista) {
            if (lista.length > 0) {
                $('#Rol').empty();

                for (var i = 0; i < lista.length; i++) {
                    rol = lista[i].Rol;
                    empresa = lista[i].Dominio;
                    dominio = lista[i].Subdominio;
                    console.log(empresa + '.' + dominio + ':' + rol);
                   
                    $('#Rol').append(
                        "<label>Clasificacion:</label>" +
                        "<br>" +
                        "<span class='badge text-bg-success text-white'>" + empresa + "." + dominio + ": <a href='#' class='text-white'>" + rol +"</a></span>"
                    );
                }
                document.cookie = "rol="+rol;

            } else {
                $('#Rol').append('<label>Este cliente/proveedor no cuenta con un rol asignado</label>');
            }
        });
        //======================================================== Tipo de regimen
        var regimen = $('#MainContent_hfRegimen').val();
        var etiqueta;
        switch (regimen) {
                   // <asp:HyperLink ID="hlClientesA" NavigateUrl="~/admin/consulta/consulta.aspx?type=3" CssClass="btn btn-secondary btn-sm" runat="server">Detalles</asp:HyperLink>
            case '1': //fisica 
        etiqueta = "<span class='badge text-bg-primary'><a href='../consulta/consulta.aspx?type=1' class='text-white'>persona fisica</a></span>";

                break;
            case '0'://moral
                etiqueta = "<span class='badge text-bg-primary'><a href='../consulta/consulta.aspx?type=0' class='text-white'>persona moral</a></span>";
                break;
            case '2'://extranjero
                etiqueta = "<span class='badge text-bg-primary'><a href='#' class='text-white'>persona extranjera</a></span>";
                break;
        }
        $('#Regimen').append(
            etiqueta
        );
    }
}


function ObtenerContactos() {
    //tContactos
    let tContactos = $('#tContactos tbody');

    let searchParams = new URLSearchParams(window.location.search);
    let id = searchParams.get('id');

    GetAjax("../usuarios/wsUsuarios.asmx/ObtenerContactos", "'RFC':'"+id+"'", false, function (lstContacto) {
        if (lstContacto.length > 0) {
            tContactos.empty();
                   
            for (var i = 0; i < lstContacto.length; i++) {
                let Tipo = lstContacto[i].Tipo;
                //Comp Fra AAMX AAUSA
                switch (Tipo) {
                    case 'Comp':
                        Tipo = 'Compañia';
                        break;
                    case 'Fra':
                        Tipo = 'Facturacion';
                        break;
                    case 'AAMX':
                        Tipo = 'Agente aduanal mexicano';
                        break;
                    case 'AAUSA':
                        Tipo = 'Agente aduanal americano';
                        break;
                }     

                tContactos.append(
                    "<tr>" +
                    //Contacto
                    "<td>" + lstContacto[i].Contacto + "</td>" +
                    //Puesto
                    "<td>" + lstContacto[i].Puesto+"</td>" +
                    //Correo
                    "<td>" + lstContacto[i].Correo+"</td>" +
                    //Telefono
                    "<td>" + lstContacto[i].Telefono+"</td>" +
                    //Extension
                    "<td>" + lstContacto[i].Extension+"</td>" +
                    //Celular
                    "<td>" + lstContacto[i].Celular+"</td>" +
                    //Tipo de contacto
                    "<td>" + Tipo+"</td>" +
                    "</tr>"
                );
            }
        }
    });
}


function ListaContactos() {
    //contactos
    let Directorio = $('#contactos');
    let searchParams = new URLSearchParams(window.location.search);
    let id = searchParams.get('id');

    GetAjax("../usuarios/wsUsuarios.asmx/ObtenerContactos", "'RFC':'" + id + "'", false, function (lstContacto) {
        if (lstContacto.length > 0) {
            Directorio.html("");

            for (var i = 0; i < lstContacto.length; i++) {
                let Tipo = lstContacto[i].Tipo;
                //Comp Fra AAMX AAUSA
                switch (Tipo) {
                    case 'Comp':
                        Tipo = 'Compañia';
                        break;
                    case 'Fra':
                        Tipo = 'Facturacion';
                        break;
                    
                }
                if (Tipo == 'Compañia' || Tipo == 'Facturacion') { 
                    Directorio.append(
                        "<div class='row'>"+
                            "<div class='col'>" +
                                "<div class='form-check'>" +
                                    "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                                    "<label class='form-check-label' for='flexCheckDefault'>" +
                                    "<span><label name='contacto'>" + lstContacto[i].Contacto + "</label> (" + lstContacto[i].Puesto + ")<br>" +
                                    "<small><label name='correo'>" + lstContacto[i].Correo + "</label></small><br>" +
                                    "<small>" + Tipo + "</small>" +
                                    "</span>" +
                                    "</label>" +
                                "</div>" +
                            "</div>" +
                        "</div>"
                    );
                }
            }
        }
    });

}

