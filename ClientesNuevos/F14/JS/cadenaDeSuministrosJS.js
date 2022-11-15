var count = 1;

$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    let radio = '';

    let urlParams = new URLSearchParams(window.location.search);
    let acomp = urlParams.get('rfc');

    if (acomp != null) {
        getEstatusAdmin(acomp);

    } else {
        getEstatus();

    }


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

   

    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();
    });

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
                 documento += ClsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
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
    html += '<th><label>' + number + '</label></th>';
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

function ObtenerPrograma() {
    let descrip;
    let codigo;
    let ruta;
    let comp;
    let aux;
    let IdProgram;
    let hayRuta;
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            comp = res;
        });
    GetAjax("../wsBaseDatos.asmx/ObtenerProgramas", "'ID_compania':'" + comp + "'", false, function (programa) {
        if (programa.length > 0) {
            //$('#radCertificadoSi').prop('checked', true);
            document.getElementById('radCertificadoSi').checked = true;

            $('#divCertificado').show('fast');
            
            for (var i = 0; i < programa.length; i++) {
                descrip = programa[i].Descripcion;
                codigo = programa[i].Codigo;
                ruta = programa[i].ruta;
                IdProgram = programa[i].ID;
                aux = i + 1;

                if (ruta == "null") {
                    hayRuta = '<div class="col">' + //col principal
                        '<div class="row">' + //row
                        '<div class="col">' + //col1
                        '<div class="input-group mb-3">' + //input
                        '<input type = "file" class="form-control documento" name="in_Certificado[]"  accept = ".pdf" >' +
                        '</div >' + //input
                        '</div>' + //col1
                        '</div>' + //row
                        '</div>'; //col principal
                } else {
                    hayRuta = '<div class="col">' + //col principal
                        '<div class="row">' + //row
                        '<div class="col">' + //col1
                            '<div class="input-group mb-3">' + //input
                                '<input type = "file" class="form-control documento" name="in_Certificado[]"  accept = ".pdf" hidden>' +

                                '</div >' + //input
                        '</div>' + //col1
                        '<div class="col">' + //col2
                            '<button class="btn btn-warning edit" name="edit" type="button"><i class="bi bi-pencil-square"></i>Cambiar archivo</button>' +
                            '<a href="../../hViewer.ashx?url='+ruta+'" class="btn btn-secondary">Ver</a>'+
                            '<button class="btn btn-secondary ver" name="ver" type="button"><i class="bi bi-folder-fill"></i>Ver</button>' +
                            '</div>' + //col2
                        '</div>' + //row
                       
                        '</div>'; //col principal
                }

                var html = '<tr>';
                //numero
                html += '<th><label>' + aux + '</label></th>';
                //Descripcion
                html += '<td>' +
                    '<div class="col">' +
                    '<label class="lblId" hidden>' + IdProgram + '</label>' +
                    '<input type="text" name="in_Descripcion" class="form-control descripcion" value="' + descrip + '">'+
                '</div>' +
                    '</td > ';
                //codigo
                html += '<td><div class="col"><input type="text" name="in_Codigo" class="form-control codigo" value="' + codigo + '"></div></td > ';
                
                //certificado
                html += '<td>' + hayRuta + '</td>';
                //boton
                if (aux > 1) {                    
                    html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
                    $('#tProgramaDeSeguridad tbody').append(html);
                } else {
                    html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
                    $('#tProgramaDeSeguridad tbody').html(html);
                }
                count = aux;
            }
        } else {
            //$('#radCertificadoNo').prop('checked', true);
            document.getElementById('radCertificadoNo').checked = true;


            dynamic_field(1);

        }

    });
}

function getEstatusAdmin(compa) {

    GetAjax("../wsBaseDatos.asmx/ObtenerEstatus", "'id':'" + compa + "'", false, function (lst) {
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