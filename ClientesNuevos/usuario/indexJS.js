

$(document).ready(function() {

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
            modalLabel.textContent = `Seleccione el archivo correspondiente a su ${recipient}`;

            const lblErr = UploadDoc.querySelector('#MainContent_lblErr');
            //lblErr.textContent = `${recipient}`;

            tipo = `${recipient}`;
         });
    }

    $('#btnRegistro').click(function () {
        window.location.href = '../F14/Secciones/InformacionCompania.aspx';
    });
    $('#btnMapeo').click(function () {
        window.location.href = '../F43/MapeoFlujo.aspx';
    });
    $('#btnEvaluacion').click(function () {
        window.location.href = '../F5/EvaluacionSeguridad.aspx';
    });
    $('#btnCartaCompromiso').click(function () {
        window.location.href = '../F12/PoliticaSeguridad.aspx';
    });

    $('#btnCancelarFile').click(function () {
        limpiar();       
    });

    $('#btnPrueba').click(function () {
        guardarDocumento(tipo);
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
    GetAjax("../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });

    document.querySelectorAll(".drop-zone__input").forEach(inputElement => {
       
        if (inputElement.files.length) {
            data.append(inputElement.files[0].name, inputElement.files[0])
            $.ajax({
                url: "hFileController.ashx?idcomp=" + id_cuenta + "&desc=" + tipo,
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

}
