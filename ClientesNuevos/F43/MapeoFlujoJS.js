/// <reference path="../scripts/jquery-3.6.0.min.js" />

/// <reference path="../scripts/js/ajax.js" />

$(document).ready(function () {
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    //Tabla de informacion 
    var count = 1;
    dynamic_field(count);

    $('#btnContinuar').click(function () {

        $('#error').html('');
        Insertar_Registros();        
    });

    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();

        $(this).find('tr').each(function (i) {
            $(this).find('td:first').text(i + count);
        });
    });

    $('#tMapeo tbody').sortable({
        stop: function (event, ui) {
            $('#tMapeo tbody').find('tr').each(function (i) {
                $(this).find('td:first').text(i + 1);
            })
        }
    });
});

function dynamic_field(number) {
    var html = '<tr>';
    html += '<td><span name="in_numero">' + number + '</sapn></td>';
    html +='<td><div class="col"><textarea  name="in_proveedor" class="form-control" value=""></textarea></div></td > ';
    html += '<td><div class="col"><textarea type="text" name="in_proceso" class="form-control"></textarea></div></td>';
    html += '<td>' +
        '<div class="col">' +
            '<select name="in_movimiento" class="form-select">' +
                '<option value="si">Si</option>'+
                '<option value="no">No</option>'+
                '<option value="na">N/A</option>' +
            '</select>' +
        '</div>' +
        '</td>';
    html += '<td><div class="col"><textarea type="text" name="in_detalles" class="form-control"></textarea></div></td>';
    html += '<td><div class="col"><textarea type="text" name="in_dias" class="form-control"></textarea></div></td>';
    html += '<td><div class="col"><textarea name="in_modo" class="form-control" ></textarea></div></td>';
    html += '<td><div class="col"><textarea name="in_pregunta" class="form-control" ></textarea></div></td>';

    //<input type="text" name="in_pregunta" class="form-control">
        if (number > 1) {
            html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
            $('#tMapeo tbody').append(html);
        } else {
            html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
            $('#tMapeo tbody').html(html);
        }
}



function Insertar_Registros() {
    var aux = 1, aux1 = 1, aux2 = 1, aux3 = 1, aux4 = 1, aux5 = 1, aux6 = 1, aux8 = 0;
    var numero = [];
    var proveedor = [];
    var proceso = [];
    var movimiento = [];
    var detalles = [];
    var dias = [];
    var modo = [];
    var pregunta = [];
    var error = '';
    var auditor = $('#txtAuditor');
    var Mapeo;
    var id;
    var resultado = '', result = '';

    GetAjax("../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id = res;
        });

    $('[name="in_numero"]').each(function () {
        numero.push($(this).text());
    });

    $('[name="in_proveedor"]').each(function () {

        if ($(this).val() == '') {
            error += '<p>*LLene el campo de proveedor de la linea ' + aux + '</p>'
        } else {
            proveedor.push($(this).val());
        }

        aux = aux + 1;
    });

    $('[name="in_proceso"]').each(function () {

        if ($(this).val() == '') {
            error += '<p>*LLene el campo de proceso de la linea ' + aux1 + '</p>'
        } else {
            proceso.push($(this).val());
        }
        aux1 = aux1 + 1;
    });

    $('[name="in_movimiento"]').each(function () {
        movimiento.push($(this).find('option:selected').text());
        aux2 = aux2 + 1;
    });

    $('[name="in_detalles"]').each(function () {
        if ($(this).val() == '') {
            error += '<p>*LLene el campo de detalles de la linea ' + aux3 + '</p>'
        } else {
            detalles.push($(this).val());
        }
        aux3 = aux3 + 1;
    });

    $('[name="in_dias"]').each(function () {
        if ($(this).val() == '') {
            error += '<p>*Especifique la cantidad de dias de la linea ' + aux4 + '</p>'
        } else {
            dias.push($(this).val());
        }
        aux4 = aux4 + 1;
    });

    $('[name="in_modo"]').each(function () {
        if ($(this).val() == '') {
            error += '<p>*Especifique el modo de transporte de la linea ' + aux5 + '</p>'
        } else {
            modo.push($(this).val());
        }
        aux5 = aux5 + 1;
    });

    $('[name="in_pregunta"]').each(function () {
        if ($(this).val() == '') {
            error += '<p>*Responda la pregunta de la linea ' + aux6 + '</p>'
        } else {
            pregunta.push($(this).val());
        }
        aux6 = aux6 + 1;
    });

    if (auditor.val() == '') {
        error += '<p>* Especifique quien es su auditor</p>';
    }

    if (error == '') {
        Mapeo = id + '_F43'
        GetAjax("MapeoBD.asmx/Registrar_Mapeo", "'ID_compania':'" + id + "','ID_mapeo':'" + Mapeo + "','auditor':'" + auditor.val() + "'", false, function (mapeo) {
            resultado += mapeo;
        });
        GetAjax("MapeoBD.asmx/BuscaryBorrar_Mapeo","'ID_Mapeo':'"+ Mapeo +"'", false, function (res) {
            console.log(res);
        });

        for (var i = 0; i < numero.length; i++) {
            GetAjax("MapeoBD.asmx/Insertar_DetallesMapeo",
                "'ID_Mapeo':'" + Mapeo + "'," +
                "'no_paso':'" + numero[i] + "'," +
                "'Provedor':'" + proveedor[i] + "'," +
                "'Proceso':'" + proceso[i] + "'," +
                "'Movimiento':'" + movimiento[i] + "'," +
                "'Detalles':'" + detalles[i] + "'," +
                "'dias_reposo':'" + dias[i] + "'," +
                "'modo_transporte':'" + modo[i] + "'," +
                "'pregunta':'" + pregunta[i] + "'",
                false,
                function (res) {
                    result = res;
                });
        }
        if (result != '') {

            GetAjax("../F14/wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F43', 'Ruta':'null','Estatus':'100%'", false, function (res) {
                let pregunta = confirm('¿Desea continuar con el registro?');
                if (pregunta) {
                    window.location.href = '../F5/evaluacionseguridad.aspx';
                } else {
                    window.location.href = '../usuario/user_index.aspx';
                }
            });


        }



    } else {
        $('#error').html(
            '<div class="alert alert-danger" role="alert">' +
            '<div class="row">' +
            '<div class="col"><h5 class="alert-heading">Error</h5></div>' +
            '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
            '</div>' +
            '<div class="row">' + error + '</div>' +
            '</div>');
    }    
}