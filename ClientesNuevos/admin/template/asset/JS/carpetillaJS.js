/// <reference path="../../vendors/jquery/dist/jquery.js" />
/// <reference path="../../../../scripts/js/ajax.js" />



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

    $('#btnCancelarFile').click(function () {
        limpiar();
    });

    $('#btnPrueba').click(function () {
        guardarDocumento(tipo);
    });


    $('#pruebe').click(function () {
        ObtenerRoles();
    });
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
                $.ajax({
                    url: "../../usuario/hFileController.ashx?idcomp=" + id_cuenta + "&desc="+tipo,
                    type: "POST",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        console.log(result);
                        window.location.reload();
                    },
                    error: function (err) {
                        console.log(err.statusText);
                    }
                });
            } else {
                console.log('Seleccione un documento');
                $('#MainContent_lblErr').html('*Seleccione un documento');
            }

        });
    } else {
        console.log("Error: no se detecto ID");
    }

}


function ObtenerRoles() {
    let rfc;
    let searchParams = new URLSearchParams(window.location.search)
    if (searchParams.has('id')) {
        rfc = searchParams.get('id');
        //ObtenerRoles_Especifico
        GetAjax("../usuarios/wsUsuarios.asmx/ObtenerRoles_Especifico", "'id':'" + rfc + "'", false, function (lista) {
            if (lista.length > 0) {
                $('#Rol').empty();

                for (var i = 0; i < lista.length; i++) {
                    console.log(lista[i].Rol);
                }
            }
        });
    }
}

