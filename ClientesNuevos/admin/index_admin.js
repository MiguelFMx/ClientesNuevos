
$(document).ready(function () {

    GetData();

});



function GetData() {
    GetAjax("wsAdminIndex.asmx/Obtener_registros", "", false, function (result) {
        let table = $('#tClientes tbody');
        let tipo = "";
        let estado = "";
        table.empty();
        for (var i = 0; i < result.length; i++) {
            if (result[i].Tipo_persona == '1') {
                tipo = "moral";
            } else if (result[i].Tipo_persona == '0') {
                tipo = "fisica";
            } else {
                tipo = "extranjero";
            }

            if (result[i].Estatus == 'activo') {
                estado = '<span class="etiqueta" style="padding: 4px 2.5em;">Activo</span>';
            } else {
                estado = '<span class="etiqueta peligro">Inactivo</span>';
            }
            table.append(
                "<tr>" +
               // "<td>" + result[i].RFC + "</td>" +
               /* "<td>" + tipo + "</td>" +*/
                "<td><a>" + result[i].Nombre_comp + "</a><br/><small>" + result[i].Nombre_comercial + "</small></td>" +
                "<td>" + result[i].Fecha_registro.substring(0, 10) + "</td>" +
                "<td class='project_progress'>" + 
                "<div class='progress progress_sm'>"+
                "<div class='progress-bar bg-warning' role='progressbar' aria-label='progreso' style='width: " + result[i].Progreso + "%;' aria-valuenow='" + result[i].Progreso+"' aria-valuemin='0' aria-valuemax='100'></div>"+
                "</div>" +
                "<small>" + result[i].Progreso + "% completo</small>" +
                "</td>" +
                "<td>"+estado+"</td>"+
                //"<td><button name='view' class='btn btn-primary'>ver</button></td>" +
                "<td><a href='carpetilla/carpetilla.aspx?id=" + result[i].RFC+"&type="+tipo+"' class='btn btn-secondary'>View</a></td>" +

                "</tr>"
            );
        }
    });
}

function dtTabla() {
    let tabla = $('#tClientes');

    let table = new DataTable(tabla, {
        language: { url: '../Scripts/DataTables/es-ES.json' }
    });
}


$('#btn').click(function () {
    GetData();
});