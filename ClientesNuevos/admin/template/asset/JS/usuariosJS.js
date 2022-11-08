/// <reference path="../../../../scripts/js/ajax.js" />

$(document).ready(function () {
    


    $('#MainContent_btnAgregar').click(function () {
        let tabla = $('#MainContent_myTable tbody');
        let RFC = $('#MainContent_txtRFC').val();
        let subdom = $('#MainContent_ddSubdominio option:selected');
        let rol = $('#MainContent_ddRol option:selected');
        let dominio = $('#MainContent_ddEmpresa option:selected');
        //string rfc, string subdom, string ID_rol, string ID_empresa, string id
        GetAjax("../usuarios/wsUsuarios.asmx/Registrar_rol",
            "'rfc':'" + RFC + "'," +
            "'subdom':'" + subdom.val() + "'," +
            "'ID_rol':'" + rol.val() + "'," +
            "'ID_empresa':'" + dominio.val() + "'," +
            "'ID_rol':'" + rol.val() + "'," +
            "'id':''",
            false, function (table) {
                ObtenerRoles();
            });

        
    });

    $(document).on('click', '#remove', function () {        
       let id =  $(this).parent().closest("tr").find('td:first').text();
        alert(id);
        //Borrar_Rol find('td:first')
        //GetAjax("../usuarios/wsUsuarios.asmx/Borrar_Rol", "", false, function () {
        //    $(this).parent().closest("tr").remove();

        //});
    });

});

function ObtenerRoles() {
    //Obtener_roles_user(string RFC)

    GetAjax("../usuarios/wsUsuarios.asmx/Obtener_roles_user",
        "'RFC':'" + RFC + "'",
        false, function (table) {

            if (table.Rows.Count > 0) {
                for (var i = 0; i < table.Rows.Count; i++) {
                    tabla.append(
                        "<tr>" +
                        "<td hidden>" + table.Rows[i]['Id'].toString() + "</td>" +
                        "<td>" + table.Rows[i]['RFC'].toString() + "</td>" +
                        "<td>" + table.Rows[i]['subdominio'].toString() + "</td>" +
                        "<td>" + table.Rows[i]['Rol'].toString() + "</td>" +

                        "<td><button name='remove' id='remove' class='btn btn-danger btn-sm rounded-5'><i class='bi bi-x'></i></button></td>" +
                        "</tr>"
                    );
                }
            }
           
        });
}

