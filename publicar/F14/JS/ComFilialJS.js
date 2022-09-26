
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />


$(document).ready(function(){
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    //Almacenar informacion de compañia filial en la tabla


    $('#btnContinuar').click(function () {
        var id;
        let noregstr;
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                id = res;
            });

        GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'60%'", false, function (res) {
            alert(res);
        });
        //window.location.href = 'TipoServicioProductos.aspx';
        $('td').each(function () {
            if ($(this).text() == 'No hay registros') {
                noregstr = 'si';
            } else {
                noregstr='no';
            }
        });
        if (noregstr == 'si') {
            let prgunta = confirm('No ha registrado ninguna empresa filial, ¿desea continuar?');
            if (prgunta == true) {
                window.location.href = 'TipoServicioProductos.aspx';
            }
        } else {
            window.location.href = 'TipoServicioProductos.aspx';
        }

    });

    $('#btnHomie').click(function () {

        var id;
        var noregistro='';
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                id = res;
            });

        
        //window.location.href = 'TipoServicioProductos.aspx';
        $('td').each(function () {
            if ($(this).text() == 'No hay registros') {
                noregistro = 'si';
            } else {
                noregistro='no';
            }
        });
        if (noregistro == 'si') {
            let prgunta = confirm('No ha registrado ninguna empresa filial, ¿desea continuar?');
            if (prgunta == true) {
                GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'60%'", false, function (res) {
                    console.log(res);
                });

                window.location.href = '../../usuario/user_index.aspx';
            }
        } else {
            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'60%'", false, function (res) {
                console.log(res);
            });
            window.location.href = '../../usuario/user_index.aspx';
        }
    });


    $('#btnAgregarComFilial').click(function () {
        insertar_registro();
        
    });

    //Evento click en elboton generado en la tabla, borra tr y borra registro de BD
    $(document).on('click', '#removefil', function () {

       
        var id_com = $(this).closest('tr').find('.index').text();

        let pregunta = confirm('¿Seguro que desea eliminar este registro?');

        if (pregunta == true) {
            GetAjax("../wsBaseDatos.asmx/BorrarComFilial", "'index':'" + id_com + "'", false, function (msg) {
                alert(msg);
            });

            $(this).parent().closest("tr").remove();
            $('#tComFil tbody').empty();
            llenarTabla();
        }
       
    });


});

//LLena la tabla, se utiliza al cargar la pagina y al guardar un registro
function llenarTabla() {
    var tabla = $('#tComFil tbody');
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            GetAjax("../wsBaseDatos.asmx/Get_companiaFilial", "'id_comp':'" + res + "'", false, function (list) {
                tabla.empty;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        tabla.append(
                            "<tr>" +
                            "<td class='index' hidden><span>" + list[i].ID + "</span></td>" +
                            "<td><span>" + list[i].Nombre + "</span></td>" +
                            "<td><span>" + list[i].Nombre_comercial + "</span></td>" +
                            "<td><span>" + list[i].RFC + "</span></td>" +
                            "<td><span>" + list[i].Direccion + "</span></td>" +
                            "<td><span>" + list[i].Pais + "</span></td>" +
                            "<td><span>" + list[i].Estado + "</span></td>" +
                            "<td><span>" + list[i].Ciudad + "</span></td>" +
                            "<td><span>" + list[i].CP + "</span></td>" +
                            "<td><span>" + list[i].Nombre_contacto + "</span></td>" +
                            "<td><span>" + list[i].Puesto_contacto + "</span></td>" +
                            "<td><span>" + list[i].Correo + "</span></td>" +
                            "<td><span>" + list[i].Telefono + "</span></td>" +
                            "<td><span>" + list[i].Extension + "</span></td>" +
                            "<td><span>" + list[i].Celular + "</span></td>" +
                            "<td><button type='button'class='btn btn-danger btn-sm' name='remove' id='removefil' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
                            "</tr>"

                        );
                    }
                } else {
                    tabla.append("<tr><td colspan='16' class='text-secondary' style='text-align:center;'>No hay registros</td></tr>");
                }
            });
        });

}

function insertar_registro() {

    $('#NombreCompaniaFilial').html('');
    $('#NombrComFilial').html('');
    $('#DirecFiscalComFilial').html('');
    $('#RfcComFilial').html('');
    $('#CPComFIlial').html('');
    $('#NombrContFilial').html('');
    $('#PuestoContFilial').html('');
    $('#CorreoContFilial').html('');
    $('#TelContFilial').html('');
    $('#CelContFilial').html('');

    $('#tComFil tbody').empty();

    let nmbrCompania = $('#MainContent_txtNombreCompaniaFilial');
    let nmbrComercial = $('#MainContent_txtNombrComFilial');
    let direcc = $('#MainContent_txtDirecFiscalComFilial');
    let rfc_reg = $('#MainContent_txtRfcComFilial');
    let pais_reg = $('#MainContent_ddPaisComFilial option:selected');
    let estado_reg = $('#MainContent_ddEstadoComFilial option:selected');
    let ciudad_reg = $('#MainContent_ddCiudadComFilial option:selected');
    let cp_reg = $('#MainContent_txtCPComFIlial');
    let contacto_reg = $('#MainContent_txtNombrContFilial');
    let puesto_reg = $('#MainContent_txtPuestoContFilial');
    let correo_reg = $('#MainContent_txtCorreoContFilial');
    let tel_reg = $('#MainContent_txtTelContFilial');
    let ext_reg = $('#MainContent_txtExtContFilial');
    let cel_reg = $('#MainContent_txtCelContFilial');
    let ID_comp = "";

    //obtener ID_compania
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            ID_comp = res;
        });

    //Insertar en la tabla

    if (nmbrCompania.val() != '' && nmbrComercial.val() != '' && rfc_reg.val() != '' && direcc.val() != '' && cp_reg.val() != '' && contacto_reg.val() != '' &&
        puesto_reg.val() != '' && correo_reg.val() != '' && tel_reg.val() != '' && cel_reg.val() != '') {


        GetAjax("../wsBaseDatos.asmx/insertar_CompaniaFilial",
            "'ID_compania':'" + ID_comp + "'," +
            "'Nombre':'" + nmbrCompania.val() + "'," +
            "'Nombre_comercial':'" + nmbrComercial.val() + "'," +
            "'RFC':'" + rfc_reg.val() + "'," +
            "'Direccion':'" + direcc.val() + "'," +
            "'Pais':'" + pais_reg.val() + "'," +
            "'Estado':'" + estado_reg.val() + "'," +
            "'Ciudad':'" + ciudad_reg.val() + "'," +
            "'CP':'" + cp_reg.val() + "'," +
            "'Nombre_contacto':'" + contacto_reg.val() + "'," +
            "'Puesto_contacto':'" + puesto_reg.val() + "'," +
            "'correo':'" + correo_reg.val() + "'," +
            "'Telefono':'" + tel_reg.val() + "'," +
            "'Extension':'" + ext_reg.val() + "'," +
            "'Celular':'" + cel_reg.val() + "'"
            , false, function (resultado) {

                alert(resultado);
            });
        nmbrCompania.val(""); nmbrComercial.val(""); direcc.val(""); rfc_reg.val(""); pais_reg.val(""); estado_reg.val(""); ciudad_reg.val("");
        cp_reg.val(""); contacto_reg.val(""); puesto_reg.val(""); correo_reg.val(""); tel_reg.val(""); ext_reg.val(""); cel_reg.val("");

    } else {
        if (nmbrCompania.val() == "") {
            $('#NombreCompaniaFilial').html('*campo obligatorio');
        }
        if (nmbrComercial.val() == "") {
            $('#NombrComFilial').html('*campo obligatorio');
        }
        if (direcc.val() == "") {
            $('#DirecFiscalComFilial').html('*campo obligatorio');
        }
        if (rfc_reg.val() == "") {
            $('#RfcComFilial').html('*campo obligatorio');
        }
        if (cp_reg.val() == "") {
            $('#CPComFIlial').html('*campo obligatorio');
        }
        if (contacto_reg.val() == "") {
            $('#NombrContFilial').html('*campo obligatorio');
        }
        if (puesto_reg.val() == "") {
            $('#PuestoContFilial').html('*campo obligatorio');
        }
        if (correo_reg.val() == "") {
            $('#CorreoContFilial').html('*campo obligatorio');
        }
        if (tel_reg.val() == "") {
            $('#TelContFilial').html('*campo obligatorio');
        }
        if (cel_reg.val() == "") {
            $('#CelContFilial').html('*campo obligatorio');
        }
    }
    llenarTabla();
}