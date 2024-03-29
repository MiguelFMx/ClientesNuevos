﻿

$(document).ready(function() {

    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

    cookies();

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

    /*bienvenido();*/
});

function cookies() {
    var lista = document.cookie.split(";");
    var busca;
    var micookie = '';
    for (i in lista) {
        busca = lista[i].search("ignore");
        if (busca > -1) { micookie = lista[i] }
    }
    if (micookie == '') {
        CambioDePass();
    }
}
function CambioDePass() {
    GetAjax("wsUserIndex.asmx/CambioPass", "", false, function (res) {
        if (res == "0") {
            Swal.fire({
                text: "Es necesario que cambie su contraseña",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Cambiar contraseña',
                cancelButtonText: 'Ignorar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '../usuario/user_config.aspx';
                } else {
                    document.cookie = "ignore=si";
                }
            })
        }
    });
}

function limpiar() {
    $("div").remove(".drop-zone__thumb");
    $("span").remove(".drop-zone__prompt");
    $('#MainContent_inputFile').val("");
    $("#dropzone").append("<span class='drop-zone__prompt'>Suelte el archivo o haga click aqui</span>");
}

function bienvenido() {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })

    Toast.fire({
        icon: 'success',
        title: 'Bienvenido!'
    })
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

            swal.fire({
                showConfirmButton: false,
                title: 'Subiendo archivo',
                allowOutsideClick: false,
                showSpinner: true,
                willOpen: () => {
                    Swal.showLoading();

            $.ajax({
                url: "hFileController.ashx?idcomp=" + id_cuenta + "&desc=" + tipo,
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
            $('#MainContent_lblErr').html('*Seleccione un documento');
        }
        
    });

}
