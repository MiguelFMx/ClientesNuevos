$(document).ready(function () {

    //Cada cambio hay que inicializar datatable: tabla.DataTable();

    //Obtengo tipo de consulta
    let urlParams = new URLSearchParams(window.location.search);
    let consulta;
    if (urlParams.has("type")) {
        consulta = urlParams.get('type');

        switch (consulta) {
            case "0":
                //Moral
                cargarTabla_regimen('0');
                $('#MainContent_lblTipo').html("Clientes/Proveedores con regimen fiscal de persona moral");

                break;
            case "1":
                //fisico
                cargarTabla_regimen('1');
                $('#MainContent_lblTipo').html("Clientes/Proveedores con regimen fiscal de persona fisica");

                break;
            case "2":
                //extranjero
                cargarTabla_regimen('2');
                $('#MainContent_lblTipo').html("Clientes/Proveedores extranjeros");

                break;
            case "3":
                //activos
                cargarTabla_Estatus('activo');
                $('#MainContent_lblTipo').html("Clientes/Proveedores activos");

                break;
            case "4":
                //inactivos
                cargarTabla_Estatus('inactivo');
                $('#MainContent_lblTipo').html("Clientes/Proveedores inactivos");
                break;
            case '5':
                SinOpinionPositiva('actualizar');
                $('#MainContent_lblTipo').html("Clientes/Proveedores que no han actualizado *Opinion Positiva*");
                break;
            case '6':
                SinOpinionPositiva('sinop');
                $('#MainContent_lblTipo').html("Clientes/Proveedores que no han entregado *Opinion Positiva*");
                break;
            default:
                break;
        }
    }

    var tabla = $('#tConsulta').DataTable();

});


function cargarTabla_Estatus(status) {
    var tHead = $('#tConsulta thead');
    var tBody = $('#tConsulta tbody');
    let tipo;
    let statusx;
    tHead.append(
        "<tr>" +
        "<th>RFC</th>" +
        "<th>Nombre</th>" +
        "<th>Fecha</th>" +
        "<th>Status</th>" +
        "<th>Acciones</th>" +
        "</tr>"
    );

    GetAjax("wsConsultas.asmx/Obtener_registros", "'status':'"+status+"'", false, function(estado) {
        tBody.empty();
        console.log(estado.length);
        if (estado.length > 0) {
            for (var i = 0; i < estado.length; i++) {
                tipo = estado[i].Tipo_persona;
                if (tipo == '0') {
                    tipo = "moral";
                } else if (tipo == '1') {
                    tipo = "fisica";
                } else {
                    tipo = "extranjero";
                }

                if (status == 'activo') {
                    statusx = '<span class="etiqueta">Activo</span>';
                } else {
                    statusx = '<span class="etiqueta peligro" style="padding: 0 1.7em;">Inactivo</span>';
                }

                tBody.append(
                    "<tr>" +
                    "<td>" + estado[i].ID_compania + "</td>" +
                    "<td><a>" + estado[i].Nombre_comp + "</a><br/><small  style='color:#73879C;'>" + estado[i].Nombre_comercial + "</small></td>" +
                    "<td>" + estado[i].Fecha_registro.substring(0, 10) + "</td>" +
                    "<td>" + statusx +"</td>"+
                    "<td><a href='../carpetilla/carpetilla.aspx?id=" + estado[i].ID_compania+"&type="+tipo+"' class='btn btn-secondary btn-sm'>View</a></td>" +
                    "</tr>"
                );
            }           
        } else {
            tBody.append("<tr><td colspan='5'>No hay datos<td></tr>");
        }

    });  
}

function SinOpinionPositiva(op) {
    var tHead = $('#tConsulta thead');
    var tBody = $('#tConsulta tbody');
    let tipo;
    let status;
    tHead.append(
        "<tr>" +
        "<th>RFC</th>" +
        "<th>Nombre</th>" +
        "<th>Documento</th>" +
        "<th>Status documento</th>" +
        "<th>Ultima actualizacion</th>" +
        "<th>Acciones</th>" +
        "</tr>"
    );

    GetAjax("wsConsultas.asmx/Obtener_OP", "", false, function (lista) {
        tBody.empty();
        console.log(lista);
        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {                

                //Estatus del documento
                var estadodoc = lista[i].Status_doc;
                switch (estadodoc) {
                    case '100%':
                        status = '<span class="etiqueta">Entregado</span>';
                        break;
                    case 'revision':
                        status = '<span class="etiqueta revision">revision</span>';
                        break;
                    case 'act':
                        status = '<span class="etiqueta actualizar">Actualizar</span>';
                        break;
                    case 'updated':
                        status = '<span class="etiqueta updated">Actulizado</span>';
                        break;
                    default:
                        //Sin OP
                        status = '<span class="etiqueta pendiente">Pendiente</span>';
                        break;
                }
                if (op == 'actualizar') {
                    if (estadodoc != 'pendiente') {
                        tBody.append(
                            "<tr>" +
                            "<td>" + lista[i].ID_compania + "</td>" +
                            "<td><a>" + lista[i].Nombre_comp + "</a><br/><small  style='color:#73879C;'>" + lista[i].Nombre_comercial + "</small></td>" +
                            "<td>" + lista[i].Documento + "</td>" +
                            "<td>" + status + "</td>" +
                            "<td>" + lista[i].Fecha_creacion + "</td>" +
                            "<td><a href='../carpetilla/carpetilla.aspx?id=" + lista[i].ID_compania + "&type=" + tipo + "' class='btn btn-secondary btn-sm'>View</a></td>" +
                            "</tr>"
                        );
                    }
                } else {
                    if (estadodoc == 'pendiente') {
                        tBody.append(
                            "<tr>" +
                            "<td>" + lista[i].ID_compania + "</td>" +
                            "<td><a>" + lista[i].Nombre_comp + "</a><br/><small  style='color:#73879C;'>" + lista[i].Nombre_comercial + "</small></td>" +
                            "<td>" + lista[i].Documento + "</td>" +
                            "<td>" + status + "</td>" +
                            "<td>" + lista[i].Fecha_creacion + "</td>" +
                            "<td><a href='../carpetilla/carpetilla.aspx?id=" + lista[i].ID_compania + "&type=" + tipo + "' class='btn btn-secondary btn-sm'>View</a></td>" +
                            "</tr>"
                        );
                    }
                }
            }
        } else {
            tBody.append("<tr><td colspan='5'>No hay datos<td></tr>");
        }

    });
}

function cargarTabla_regimen(regimen) {
    var tHead = $('#tConsulta thead');
    var tBody = $('#tConsulta tbody');
    let tipo;
    let status;
    tHead.append(
        "<tr>" +
        "<th>RFC</th>" +
        "<th>Nombre</th>" +
        "<th>Fecha</th>" +
        "<th>Regimen</th>" +
        "<th>Status</th>" +
        "<th>Acciones</th>" +
        "</tr>"
    );

    GetAjax("wsConsultas.asmx/Obtener_tipoRegimen", "'regimen':'" + regimen + "'", false, function (estado) {
        tBody.empty();
        console.log(estado.length);
        if (estado.length > 0) {
            for (var i = 0; i < estado.length; i++) {
                tipo = estado[i].Tipo_persona;
                if (tipo == '0') {
                    tipo = "moral";
                } else if (tipo == '1') {
                    tipo = "fisica";
                } else {
                    tipo = "extranjero";
                }

                if (estado[i].Estatus == 'activo') {
                    status = '<span class="etiqueta">Activo</span>';
                } else {
                    status = '<span class="etiqueta peligro" style="padding: 0 1.7em;">Inactivo</span>';
                }

                tBody.append(
                    "<tr>" +
                    "<td>" + estado[i].ID_compania + "</td>" +
                    "<td><a>" + estado[i].Nombre_comp + "</a><br/><small  style='color:#73879C;'>" + estado[i].Nombre_comercial + "</small></td>" +
                    "<td>" + estado[i].Fecha_registro.substring(0, 10) + "</td>" +
                    "<td>" + tipo + "</td>" +
                    "<td>" + status + "</td>" +
                    "<td><a href='../carpetilla/carpetilla.aspx?id=" + estado[i].ID_compania + "&type=" + tipo + "' class='btn btn-secondary btn-sm'>View</a></td>" +
                    "</tr>"
                );
            }
        } else {
            tBody.append("<tr><td colspan='5'>No hay datos<td></tr>");
        }

    });
}