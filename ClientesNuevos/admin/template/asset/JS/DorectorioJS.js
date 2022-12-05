/// <reference path="../../../../scripts/js/ajax.js" />

NProgress.start();

$(document).ready(function () {
    ObtenerContacto();
    var table = $('#tDirectorio').DataTable();

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
        const modalCorreo = exampleModal.querySelector('#txtCorreo')
        const modalBodyInput = exampleModal.querySelector('.modal-body input')

        modalCorreo.textContent = `${recipient}`
        modalBodyInput.value = recipient
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
                    "<td><button id='btnMensaje' type='button' name='correo' class='btn btn-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#exampleModal' data-bs-whatever='" + lstTabla[i].Correo+"'><i class='bi bi-envelope'></i></button></td>" +
                    "</tr>"
                );
                console.log[i];
            }
        }
    });
}