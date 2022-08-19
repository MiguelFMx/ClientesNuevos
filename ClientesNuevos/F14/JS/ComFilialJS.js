
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />


$(document).ready(function(){
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    //Almacenar informacion de compañia filial en la tabla
    $('#btnAgregarComFilial').on('click', function () {
        $('#tComFil tbody').empty();

        let nombreCompania = $('#MainContent_txtNombreCompaniaFilial');
        let nombreComercial = $('#MainContent_txtNombrComFilial');
        let direccion = $('#MainContent_txtDirecFiscalComFilial');
        let rfc = $('#MainContent_txtRfcComFilial');
        let pais = $('#MainContent_ddPaisComFilial option:selected');
        let estado = $('#MainContent_ddEstadoComFilial option:selected');
        let ciudad = $('#MainContent_ddCiudadComFilial option:selected');
        let cp = $('#MainContent_txtCPComFIlial');
        let contacto = $('#MainContent_txtNombrContFilial');
        let puesto = $('#MainContent_txtPuestoContFilial');
        let correo = $('#MainContent_txtCorreoContFilial');
        let tel = $('#MainContent_txtTelContFilial');
        let ext = $('#MainContent_txtExtContFilial');
        let cel = $('#MainContent_txtCelContFilial');
        let ID_comp = "";

        //obtener ID_compania
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                ID_comp = res;
        });

        //Insertar en la tabla
        GetAjax("../wsBaseDatos.asmx/insertar_CompaniaFilial",
            "'ID_compania':'" + ID_comp + "'," +
            "'Nombre':'" + nombreCompania.val() + "'," +
            "'Nombre_comercial':'" + nombreComercial.val() + "'," +
            "'RFC':'" + rfc.val() + "'," +
            "'Direccion':'" + direccion.val() + "'," +
            "'Pais':'" + pais.val() + "'," +
            "'Estado':'" + estado.val() + "'," +
            "'Ciudad':'" + ciudad.val() + "'," +
            "'CP':'" + cp.val() + "'," +
            "'Nombre_contacto':'" + contacto.val() + "'," +
            "'Puesto_contacto':'" + puesto.val() + "'," +
            "'correo':'" + correo.val() + "'," +
            "'Telefono':'" + tel.val() + "'," +
            "'Extension':'" + ext.val() + "'," +
            "'Celular':'" + cel.val() + "'"
            , false, function (resultado) {

                alert(resultado)

                nombreCompania.val(""); nombreComercial.val(""); direccion.val(""); rfc.val(""); pais.val(""); estado.val(""); ciudad.val("");
                cp.val(""); contacto.val(""); puesto.val(""); correo.val(""); tel.val(""); ext.val(""); cel.val("");

                llenarTabla();
        });


        
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


    $('#btnMostrar').click(function () {
        $('#tComFil tbody').empty();
        llenarTabla();
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
                    tabla.append("<tr><td colspan='16' class='text-secondary' style='text-align:center;'><span>No hay registros</span></td></tr>");
                }
            });
        });

}