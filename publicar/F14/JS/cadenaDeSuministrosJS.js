
$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    let radio = '';

    $('input[type=radio][name=radCertificado]').change(function () {
        if (this.value == 'si') {
            radio = 'si';
            $('#divCertificado').show('fast');
        }
        else if (this.value == 'no') {
            radio = 'no';
            $('#divCertificado').hide('fast');
        }
    });

    if (sessionStorage.getItem('ctipo') == 'proveedor') {
        $('#wizard2').prop('hidden', false);
        $('#wizard').prop('hidden', true);
    } else {
        $('#wizard2').prop('hidden', true);
        $('#wizard').prop('hidden', false);

    }


    var count = 1;
    dynamic_field(count);



    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();
    });

    //$('#tProgramaDeSeguridad tbody').sortable();

    $('#btnContinuar').click(function () {
        var id;
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                id = res;
            });        

        if (radio == 'si') {

            insertar_certificacion();
            insertar_estatus();
            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'revision'", false, function (res) {
                let alert = confirm('¿Desea continuar?');
                if (alert) {
                    window.location.href = '../../F43/MapeoFlujo.aspx?res=Exito';
                } else {
                    window.location.href = '../../usuario/user_index.aspx?res=f14';
                }

            });

        } else if (radio == 'no') {

            insertar_estatus();
            //     documento += ClsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'revision'", false, function (res) {
                let alert = confirm('¿Desea continuar?');
                if (alert) {
                    window.location.href = '../../F43/MapeoFlujo.aspx?res=Exito';
                } else {
                    window.location.href = '../../usuario/user_index.aspx?res=f14';
                }

            });
        } else if (radio == '') {
            $('#errorRadio').html(
                '<div class="alert alert-warning" role="alert">' +
                '<div class="row">' +
                '<div class="col"><h5 class="alert-heading"><i class="bi bi-exclamation-triangle-fill"></i> Error</h5></div>' +
                '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
                '</div>' +
                '<div class="row">Selecione una respuesta a la pregunta</div>' +
                '</div>');
        }

        
    });
    $('#btnHome').click(function () {
        var id;
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                id = res;
            });

        if (radio == 'si') {

            insertar_certificacion();
            insertar_estatus();

            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'100%'", false, function (res) {
                console.log(res);
                window.location.href = '../../usuario/user_index.aspx?res=f14';

            });
        } else if (radio == 'no') {

            insertar_estatus();
            //     documento += ClsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'100%'", false, function (res) {
                console.log(res);
                window.location.href = '../../usuario/user_index.aspx?res=f14';

            });
        } else if (radio == '') {
            $('#errorRadio').html(
                '<div class="alert alert-warning" role="alert">' +
                '<div class="row">' +
                '<div class="col"><h5 class="alert-heading"><i class="bi bi-exclamation-triangle-fill"></i> Error</h5></div>' +
                '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
                '</div>' +
                '<div class="row">Selecione una respuesta a la pregunta</div>' +
                '</div>');
        }
    });

    $('#btnPrueba').click(function (ev) {
        insertar_certificacion();

        ev.preventDefault();
    });
    
});

$("#cbCTPATSatuts").change(function () {
    var status = $('#cbCTPATSatuts option:selected').val();

    switch (status) {
        case '0':
            $('#divFecha').hide('fast');
            $('#MainContent_txtCTPATCuenta').val("");
            $('#MainContent_dtFechaVal').val("");
            break;
        case '1':
            $('#divFecha').show('fast');

            break;
        case '2':
            $('#divFecha').show('fast');
            break;
    }

});


function dynamic_field(number) {
    var html = '<tr>';
    html += '<td><span>' + number + '</sapn></td>';
    html += '<td><div class="col"><input type="text" name="in_Descripcion" class="form-control descripcion"></div></td > ';   
    html += '<td><div class="col"><input type="text" name="in_Codigo" class="form-control codigo"></div></td>';
    html += '<td>' +
            '<div class="input-group mb-3">' +
            '<input type = "file" class="form-control documento" name="in_Certificado[]"  accept = ".pdf" >' +
            '</div >' +
            '</td>';


    if (number > 1) {
        html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
        $('#tProgramaDeSeguridad tbody').append(html);
    } else {
        html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
        $('#tProgramaDeSeguridad tbody').html(html);
    }
}

function insertar_certificacion() {
    var count = 1; var coun = 1, aux=1;

    let arrDescripcion = [];
    let arrCodigo = [];
    let arrDocumento = [];

    $('#error').html('');
    var error = '';


    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });

    $('.descripcion').each(function () {
        
        if ($(this).val() == '') {
            error += '<p>Ingrese la descripcion de la fila ' + coun + '</p>';
        } else {
            arrDescripcion.push($(this).val());

        }
        coun = coun + 1;

    });
    $('.codigo').each(function () {
        
        if ($(this).val() == '') {
            error += '<p>Ingrese el codigo de la fila ' + count + '</p>';

        } else {
            arrCodigo.push($(this).val());

        }
        count = count + 1;
    });
    $('.documento').each(function () {

        var files = $(this)[0].files;
        var data = new FormData();

        if (files.length > 0) {
            if ($(this).prop("files")[0].type != "application/pdf") {
                error += '<p>La extension del documento ' + aux + ' no es el correcto </p>'
            } else {
                //arrDocumento.push($(this).prop("files")[0].name);
                data.append($(this).prop("files")[0].name, $(this).prop("files")[0]);
                arrDocumento.push(data);
            }
        } else {
            arrDocumento.push('blank');
        }
        aux = aux + 1;
    });
    if (error == '') {
        for (var i = 0; i < arrDescripcion.length; i++) {
            if (arrDocumento[i] == "blank") {
                //No subio el certificado
                $.ajax({
                    url: "../FileUploadHandler.ashx?idcomp=" + id_cuenta + "&desc=" + arrDescripcion[i] + "&codigo=" + arrCodigo[i],
                    type: "POST",
                    data: null,
                    contentType: false,
                    processData: false,
                    success: function (result) { console.log(result); },
                    error: function (err) {
                        console.log(err.statusText)
                    }
                });
            } else {
                //Se subio el certificado
                $.ajax({
                    url: "../FileUploadHandler.ashx?idcomp=" + id_cuenta + "&desc=" + arrDescripcion[i] + "&codigo=" + arrCodigo[i],
                    type: "POST",
                    data: arrDocumento[i],
                    contentType: false,
                    processData: false,
                    success: function (result) { console.log(result); },
                    error: function (err) {
                        console.log(err.statusText)
                    }
                });

            }
        }
    } else {
        $('#error').html(
            '<div class="alert alert-warning" role="alert">' +
            '<div class="row">' +
            '<div class="col"><h5 class="alert-heading"><i class="bi bi-exclamation-triangle-fill"></i> Error</h5></div>' +
            '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
            '</div>' +
            '<div class="row">' + error + '</div>' +
            '</div>');
    }    
}

function getEstatus() {
    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });

    GetAjax("../wsBaseDatos.asmx/ObtenerEstatus", "'id':'" + id_cuenta + "'", false, function (lst) {
        var fecha, strTrim;
        if (lst.length > 0) {
            //Mustro div
            $('#divFecha').show();
            //cambio el index de combox
            $('#cbCTPATSatuts').val(lst[0].Status).change();
            $('#MainContent_txtCTPATCuenta').val(lst[0].No_cuenta);

            //Movimiento fecha====================================
            //obtengo solo la fecha, ya que sale con hora
            fecha = lst[0].Fecha_validacion.substring(1, 10);

            //Separo la fecha, eliminando el /
            strTrim = fecha.split('/');

            //Si Mes es solo un numero, ej 9, se agrega un 0 ; Igual con el dia
            if (strTrim[1].length == 1) {
                strTrim[1] = "0" + strTrim[1];
            }
            //dia
            if (strTrim[0].length == 1) {
                strTrim[0] = "0" + strTrim[0];
            }
            //Pongo fecha en control:  yyyy-mm-dd
            document.getElementById('MainContent_dtFechaVal').value = strTrim[2] + "-" + strTrim[1] + "-" + strTrim[0];
        }
    });

}


function insertar_estatus() {
    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });

    var cuenta = $('#MainContent_txtCTPATCuenta').val();
    var fecha = document.getElementById("MainContent_dtFechaVal").value;
    var opcion = $('#cbCTPATSatuts option:selected').val();
    var programa = $('input[type=radio][name=radCertificado]').val();

    if (opcion != 0) {
        if (cuenta == '' || fecha == '') {
            alert('Llene los campos necesarios');
        } else {
            GetAjax("../wsBaseDatos.asmx/insertar_estatus", "'id_compania':'" + id_cuenta + "','status':'" + opcion + "','fecha':'" + fecha + "','no_cuenta':'" + cuenta + "','programa':'" + programa + "'", function (res) {
                console.log('Exito ' + res);
            });

        }
    } else {
        GetAjax("../wsBaseDatos.asmx/insertar_estatus", "'id_compania':'" + id_cuenta + "','status':'" + opcion + "','fecha':'" + fecha + "','no_cuenta':'" + cuenta + "','programa':'" + programa + "'", function (res) {
            console.log('Exito, vacio ' + res);
        });
        $('#MainContent_txtCTPATCuenta').val('');
        $('#MainContent_dtFechaVal').val('');
    }
    getEstatus();
}