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

    CargarProgress();
   
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

        document.querySelectorAll(".drop-zone__input").forEach(inputElement => {

            if (inputElement.files.length) {
                data.append(inputElement.files[0].name, inputElement.files[0])
                $.ajax({
                    url: "../../usuario/hFileController.ashx?idcomp=" + id_cuenta + "&desc=F16",
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

function CargarProgress() {
    // GetProgreso(string id_comp, string tipo)
    let searchParams = new URLSearchParams(window.location.search);
    let id_cuenta;
    let tipo;
    if (searchParams.has('id')) {
        id_cuenta = searchParams.get('id');
        tipo = searchParams.get('type');
        GetAjax("../wsAdminIndex.asmx/GetProgress", "'id_comp':'" + id_cuenta + "','tipo':'" + tipo + "'", false, function (progreso) {
            $('#pbProgress').width(progreso + "%");
        })        

    } else {
        console.log("Error: no se detecto ID");
    }
}