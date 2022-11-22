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
                $('#MainContent_lblTipo').html("Clientes/Proveedores de regimen fiscal de persona moral");

                break;
            case "1":
                //fisico
                cargarTabla_regimen('1');
                $('#MainContent_lblTipo').html("Clientes/Proveedores de regimen fiscal de persona fisico");

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
                if (tipo == '1') {
                    tipo = "moral";
                } else if (tipo == '0') {
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

//Obtener_tipoRegimen(string regimen)
/*
 SELECT C.ID_compania, C.Nombre_comercial, C.Estatus, D.Documento, D.Estatus, D.Fecha_creacion 
FROM
Table_compania AS C
INNER JOIN 
Table_Documentos AS D
ON 
C.RFC = D.ID_compania
WHERE D.Documento = 'Opinion positiva'*/
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
                if (tipo == '1') {
                    tipo = "moral";
                } else if (tipo == '0') {
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