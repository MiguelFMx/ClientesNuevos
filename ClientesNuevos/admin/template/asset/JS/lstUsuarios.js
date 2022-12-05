/// <reference path="../../../../scripts/js/ajax.js" />

$(document).ready(function () {
    cargarUsuarios();

    var tablaUser = $('#tUsuariosDet').DataTable();

    
});

function cargarUsuarios() {
    let tablas = $('#tUsuariosDet tbody');
    var RFC = '';
    var detalles = '';
    var estatus;
    GetAjax("../wsAdminIndex.asmx/Obtener_UD", "", false, function (lstUser) {
          if (lstUser.length > 0) {
            tablas.empty();
            for (var i = 0; i < lstUser.length; i++) {
                RFC = lstUser[i].RFC;

                if (lstUser[i].Status == 'activo') {
                    estatus = "<label class='etiqueta'>" + lstUser[i].Status +"</label>"
                } else {
                    estatus = "<label class='etiqueta peligro'>" + lstUser[i].Status + "</label>"

                }

                if (i == lstUser.length - 1) {
                    detalles += "<span class='badge rounded-pill bg-secondary'>" + lstUser[i].Detalles + "</span>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden>" + lstUser[i].Id + "</td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + estatus + "</td>" +
                        "<td><a href='EditarUsuario.aspx?id=" + lstUser[i].Id + "' class='btn btn-secondary btn-sm'><i class='bi bi-pencil-square'></i></a></td>" +
                        "</tr>"
                    );
                }
                else if (RFC != lstUser[i + 1].RFC) {
                    detalles += "<span class='badge rounded-pill text-bg-primary'>" + lstUser[i].Detalles + "</span>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden>" + lstUser[i].Id + "</td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + estatus + "</td>" +
                        "<td><a href='EditarUsuario.aspx?id=" + lstUser[i].Id + "' class='btn btn-secondary btn-sm'><i class='bi bi-pencil-square'></i></a></td>"+
                        "</tr>"
                    );

                    detalles = "";
                }                
                else {
                    detalles += "<span class='badge bg-secondary'>" + lstUser[i].Detalles + "</span>";

                }
            }
        }
    });
}