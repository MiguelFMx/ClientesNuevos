/// <reference path="../../../../scripts/js/ajax.js" />

$(document).ready(function () {
    let tabla = $('#tUsuarios').DataTable();
});

function cargarUsuarios() {
    GetAjax("", "", false, function (lstUser) {

        let tabla = $('#tUsuarios tbody');

        if (lstUser.lenght > 0) {
            tabla.empty();
            for (var i = 0; i < lstUser.length; i++) {
                tabla.append(
                    "<tr>" +
                    "<td></td>" +
                    "</tr>"
                );
            }
        }

    });
}