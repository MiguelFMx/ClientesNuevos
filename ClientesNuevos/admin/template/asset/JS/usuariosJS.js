/// <reference path="../../../../scripts/js/ajax.js" />

NProgress.start();
$(document).ready(function () {
    


    $('#MainContent_btnAgregar').click(function () {
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
                console.log(table + " registrado");

                $('#lblResultado').text(table);

                ObtenerRoles(RFC);
        });

        
    });



    $('#MainContent_txtRFC').keyup(function () {
        var texto = $('#MainContent_txtRFC').val();

        GetAjax("../usuarios/wsUsuarios.asmx/ExisteRFC", "'rfc':'" + texto + "'", false, function (res) {
            if (res == "si") {
                $('#sExtiste').html('Ya existe un registro con este RFC/W9');
            } else {
                $('#sExtiste').empty();

            }
        });

    });

    $('#test').click(function () {
        let idRfc = $('#MainContent_txtRFC').val();
        ObtenerRoles(idRfc);
    });


    $(document).on('click', '#remove', function () {        
       let id =  $(this).parent().closest("tr").find('td:first').text();
        let rfc = $(this).parent().closest("tr").find('.rfc').text();
        //alert(id+","+rfc);
        //Borrar_Rol find('td:first')
        GetAjax("../usuarios/wsUsuarios.asmx/Borrar_Rol", "'id':'" + id + "'", false, function (result) {
            ObtenerRoles(rfc);
            console.log(result);
        });
    });


    NProgress.done();
    NProgress.remove();
});

function ObtenerRoles(RFC) {
    //Obtener_roles_user(string RFC)
    let tabla = $('#MainContent_myTable tbody');

    GetAjax("../usuarios/wsUsuarios.asmx/Obtener_roles_user",
        "'id':'"+RFC+"'",
        false, function (table) {
            tabla.empty();
            if (table.length > 0) {
                for (var i = 0; i < table.length; i++) {
                    tabla.append(
                        "<tr>" +
                        "<td hidden>" + table[i].Id + "</td>" +
                        "<td class='rfc'>" + table[i].RFC + "</td>" +
                        "<td>" + table[i].Subdominio + "</td>" +
                        "<td>" + table[i].Rol + "</td>" +

                        "<td><button name='remove' id='remove' type='button' class='btn btn-danger btn-sm rounded-5'><i class='bi bi-x'></i></button></td>" +
                        "</tr>"
                    );
                }
            }
           
        });
}

