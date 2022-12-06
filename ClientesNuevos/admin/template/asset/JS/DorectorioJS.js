/// <reference path="../../../../scripts/js/ajax.js" />

NProgress.start();

$(document).ready(function () {
    ObtenerContacto();

    CargarDirectorio();

    var table = $('#tDirectorio').DataTable();

    var tdir = $('#tDir').DataTable();

    NProgress.done();
    NProgress.remove();


    const exampleModal = document.getElementById('exampleModal')
    exampleModal.addEventListener('show.bs.modal', event => {
        // Button that triggered the modal
        const button = event.relatedTarget
        // Extract info from data-bs-* attributes
        const recipient = button.getAttribute('data-bs-whatever')
        // If necessary, you could initiate an AJAX request here
        // and then do the updating in a callback.
        //
        // Update the modal's content.
        const modalCorreo = exampleModal.querySelector('#txtCorreo');
        const modalRemitente = exampleModal.querySelector('#txtRemitente');
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
        GetAjax("../wsAdminIndex.asmx/EnviarCorreo", "'correo':'" + correo + "','remitente':'" + remitente + "','subject':'" + subject + "','cuerpo':'"+cuerpo+"'", false, function (correo) {
            alert(correo);
        });
    });

    $('#btnSendAll').click(function () {
        var Correo = [];

        $('.form-check').each(function () {
            let checked = $(this).find($('[name=check]'));
            let mail = $(this).find($('[name=correo]'));
            let contact = $(this).find($('[name=contacto]'));
            if (checked.is(":checked")) {
                Correo.push(mail.text() + ";" + contact.text());
            }
        });
        for (var i = 0; i < Correo.length; i++) {

            var asunto = $('#txtAsuntoAll').val();
            var cuerpo = $('#txtBody').val();

            var datos = Correo[i].split(";");
            var mail = datos[0];
            var remitente = datos[1];
            GetAjax("../wsAdminIndex.asmx/EnviarCorreo", "'correo':'" + mail + "','remitente':'" + remitente + "','subject':'" + asunto + "','cuerpo':'" + cuerpo + "'", false, function (correo) {
                console.log(mail + "-" + correo);
            });

        }
    });
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
                    "<td>" + lstTabla[i].ID_compania + "</td>" +
                    "<td>" + lstTabla[i].Nombre_comercial + "</td>" +
                    "<td>" + lstTabla[i].Nombre + "</td>" +
                    "<td>" + lstTabla[i].Puesto + "</td>" +
                    "<td>" + lstTabla[i].Correo + "</td>" +
                    "<td>" + lstTabla[i].Telefono + "</td>" +
                    "<td>" + lstTabla[i].Extension + "</td>" +
                    "<td>" + lstTabla[i].Celular + "</td>" +
                    "<td>" + tipo +"</td>" +
                    "<td><button id='btnMensaje' type='button' name='correo' class='btn btn-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='" + lstTabla[i].Correo + ";" + lstTabla[i].Nombre+"'><i class='bi bi-envelope'></i></button></td>" +
                    "</tr>"
                    );
                }
                console.log[i];
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
                //directorio.append(
                //    "<div class='row'>" +
                //    "<div class='col'>" +
                //    "<div class='form-check'>" +
                //    "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                //    "<label class='form-check-label' for='flexCheckDefault'>" +
                //    "<span><label name='contacto'>" + lstTabla[i].Nombre + "</label> (" + lstTabla[i].Puesto + ")<br>" +
                //    "<small><label name='correo'>" + lstTabla[i].Correo + "</label></small><br>" +
                //    "<small>" + tipo + "</small>" +
                //    "</span>" +
                //    "</label>" +
                //    "</div>" +
                //    "</div>" +
                //    "</div> <hr>"
                //);
            }
        }
    });
}