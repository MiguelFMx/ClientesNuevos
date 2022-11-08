/// <reference path="../../../../scripts/js/ajax.js" />

$(document).ready(function () {

    cargarUsuarios();

});

function cargarUsuarios() {
    let tablas = $('#tUsuariosDet tbody');
    var RFC = '';
    var RFCx = '';
    var detalles = '';

    GetAjax("../wsAdminIndex.asmx/Obtener_UD", "", false, function (lstUser) {

        //alert(lstUser.length);

        if (lstUser.length > 0) {
            tablas.empty();
            for (var i = 0; i < lstUser.length; i++) {
                RFC = lstUser[i].RFC;
                //detalles = "<label>" + lstUser[i].Detalles + "</label><br>";

                if (i == lstUser.length - 1) {
                    detalles += "<label>" + lstUser[i].Detalles + "</label><br>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden>" + lstUser[i].Id + "</td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + lstUser[i].Status + "</td>" +
                        "<td><button class='btn btn-secondary btn-sm' id='btnDetalles'>Editar</button></td>" +
                        "</tr>"
                    );
                }
                else if (RFC != lstUser[i + 1].RFC) {
                    detalles += "<label>" + lstUser[i].Detalles + "</label><br>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden>" + lstUser[i].Id + "</td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + lstUser[i].Status + "</td>" +
                        "<td><button class='btn btn-secondary btn-sm' id='btnDetalles'>Editar</button></td>" +
                        "</tr>"
                    );
                    RFCx = lstUser[i].RFC;

                    detalles = "";
                }                
                else {
                    detalles += "<label>" + lstUser[i].Detalles + "</label><br>";
                }
            }
        }
    });
}