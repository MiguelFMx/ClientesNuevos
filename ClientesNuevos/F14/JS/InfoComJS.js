
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />


$(document).ready(function () {
    var contador = 0;

    $(document).on('click', '#remove', function () {
       
        $(this).parent().closest("tr").remove();
        contador--;
    });

    $('#btnContactoCompañia').on('click', function () {
        var nombre = $('#txtNombrCont');
        var puesto = $('#txtpuestoCont');
        var correo = $('#txtCorreoCont');
        var ext = $('#txtExtCont');
        var tel = $('#txtTelCont');
        var cel = $('#txtCelCont');


        if (nombre.val() != "" && puesto.val() != "" && correo.val() != "" && correo.val() != "" && tel.val() != "" && cel.val() != "") {
            if (contador <= 2) {
                contador++;
                //tContactoCom


                var tabla = $('#tContactoCom tbody');

                tabla.append(
                    "<tr>" +
                    "<td><span>" + nombre.val() + "</span></td>" +
                    "<td><span>" + puesto.val() + "</span></td>" +
                    "<td><span>" + correo.val() + "</span></td>" +
                    "<td><span>" + tel.val() + "</span></td>" +
                    "<td><span>" + ext.val() + "</span></td>" +
                    "<td><span>" + cel.val() + "</span></td>" +
                    "<td><button type='button'class='btn btn-danger' name='remove' id='remove' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
                    "</tr>"
                );
                nombre.val(""); puesto.val(""); correo.val(""); ext.val(""); tel.val(""); cel.val("");

                nombre.focus();
            } else {
                alert("Solo se pueden registrar 3 contactos");
            }
        } else {
            alert('Rellena los campos necesarios');
        }
    });

    $('#btnAgregarComFilial').on('click', function () {

        let nombreCompania = $('#txtNombreCompaniaFilial');
        let nombreComercial = $('#txtNombrComFilial');
        let direccion = $('#txtDirecFiscalComFilial');
        let rfc = $('#txtRfcComFilial');
        let pais = $('#cbPaisComFilial option:selected');
        let estado = $('#cboEstadoComFilial option:selected');
        let ciudad = $('#cbCiudadComFilial option:selected');
        let cp = $('#txtCPComFIlial');
        let contacto = $('#txtNombrContFilial');
        let puesto = $('#txtPuestoContFilial');
        let correo = $('#txtCorreoContFilial');
        let tel = $('#txtTelContFilial');
        let ext = $('#txtExtContFilial');
        let cel = $('#txtCelContFilial');
       

        //if (nombreCompania.val() != "" && nombreComercial.val() != "" && direccion.val() != "" && rfc.val() != "" && pais.val() != "" && estado.val() != "" && ciudad.val() != "" && cp.val() != "" && contacto.val() != "" && puesto.val() != "" && correo.val() != "" && correo.val() != "" && tel.val() != "" && cel.val() != "") {

                //tContactoCom
        var tabla2 = $('#tComFil tbody');

                tabla2.append(
                    "<tr>" +
                    "<td><span>" + nombreCompania.val() + "</span></td>" +
                    "<td><span>" + nombreComercial.val() + "</span></td>" +
                    "<td><span>" + direccion.val() + "</span></td>" +
                    "<td><span>" + rfc.val() + "</span></td>" +
                    "<td><span>" + pais.html() + "</span></td>" +
                    "<td><span>" + estado.val() + "</span></td>" +
                    "<td><span>" + ciudad.val() + "</span></td>" +
                    "<td><span>" + cp.val() + "</span></td>" +
                    "<td><span>" + contacto.val() + "</span></td>" +
                    "<td><span>" + puesto.val() + "</span></td>" +
                    "<td><span>" + correo.val() + "</span></td>" +
                    "<td><span>" + tel.val() + "</span></td>" +
                    "<td><span>" + ext.val() + "</span></td>" +
                    "<td><span>" + cel.val() + "</span></td>" +
                    "<td><button type='button'class='btn btn-danger' name='removefil' id='removefil' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
                    "</tr>"
                );
                //nombre.val(""); puesto.val(""); correo.val(""); ext.val(""); tel.val(""); cel.val("");

                //nombre.focus();
            
        //} else {
        //    alert('Rellena los campos necesarios');
        //}
    });
    $(document).on('click', '#removefil', function () {

        $(this).parent().closest("tr").remove();
        contador--;
    });
    
    $("#cbTipoDePersona").change(function () {
        var persona = $('#cbTipoDePersona option:selected').val();

        if (persona == '1') {
            $('#txtCURP').prop('readonly', false);
            fillCFDI('1');
        } else {
            $('#txtCURP').prop('readonly', true);
            fillCFDI('0');

        }

    });

    $("#cbPais").change(function () {
        var PaisSeleccionado = $('#cbPais option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cboEstado'));

        $('#cbCiudad').empty();
        $('#cbPais option[value=0]').remove();


    });

    $("#cboEstado").change(function () {
        var EstadoSeleccionado = $('#cboEstado option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudad'));
    });

    $("#cbPaisFact").change(function () {
        var PaisSeleccionado = $('#cbPaisFact option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cbEstadoFact'));

        $('#cbCiudadFact').empty();
        $('#cbPaisFact option[value=0]').remove();

    });

    $("#cbEstadoFact").change(function () {
        var EstadoSeleccionado = $('#cbEstadoFact option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudadFact'));
    });

    $("#cbPaisComFilial").change(function () {
        var PaisSeleccionado = $('#cbPaisComFilial option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cboEstadoComFilial'));

        $('#cbPaisComFilial option[value=0]').remove();
        $('#cbCiudadComFilial').empty();
    });

    $("#cboEstadoComFilial").change(function () {
        var EstadoSeleccionado = $('#cboEstadoComFilial option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudadComFilial'));
    });

    $('#chkDireccionIgual').change(function () {
        if ($(this).is(':checked')) {

            var direccion = $('#txtDirecFiscal').val();
            var cp = $('#txtCP').val();

            $('#cbPaisFact').prop('disabled', true);
            $('#cbEstadoFact').prop('disabled', true);
            $('#cbCiudadFact').prop('disabled', true);
            $('#txtDirecFacturacion').prop('readonly', true);
            $('#txtCPFacturacion').prop('readonly', true);

            $('#txtDirecFacturacion').prop('readonly', true);
            $('#txtDirecFacturacion').val(direccion);

            $('#txtCPFacturacion').prop('readonly', true);
            $('#txtCPFacturacion').val(cp);

            

        } else {
            $('#cbPaisFact').prop('disabled', false);
            $('#cbEstadoFact').prop('disabled', false);
            $('#cbCiudadFact').prop('disabled', false);
            $('#txtCPFacturacion').prop('readonly', false);
            $('#txtDirecFacturacion').prop('readonly', false);

            $('#txtDirecFacturacion').val("");
            $('#txtCPFacturacion').val("");
        }
    });

   
   
});
 $("#botonBonito").on("click", function () {
        alert('omg');
    });

function fillComboPais(combo) {

    GetAjax("../wsUbicacion.asmx/llenarCbPais","", false, function (lstPais) {
        var ObjPais;
        var ObjcbPais = combo;
        ObjcbPais.empty();
        ObjcbPais.append(
            "<option value='0'>...</option>"
        );
        for (var i = 0; i < lstPais.length; i++) {
            ObjPais = lstPais[i];

            ObjcbPais.append(
                "<option value=" + ObjPais.id + ">" + ObjPais.fullname + "</option>"                       
            );
        }
        ObjcbPais.val('0').prop('selectd', true);
        return false;
    });


    return false;
}

//llenarCFDI
function fillCFDI(regimen) {
    GetAjax("../wsUbicacion.asmx/llenarCFDI", "'tipo':"+regimen, false, function (lstCFDI) {
        var ObjCFDI;
        var cbCFDI = $('#cbUsoCFDI');
        cbCFDI.empty();
        for (var i = 0; i < lstCFDI.length; i++) {
            ObjCFDI = lstCFDI[i];

            cbCFDI.append(
                "<option value=" + ObjCFDI.clave + ">" + ObjCFDI.clave + " - " + ObjCFDI.descripcion + "</option>"
            );
        }
        cbCFDI.val('P01').prop('selected', true);
        return false;
    });
    return false;
}

function fillFP() {
    GetAjax("../wsUbicacion.asmx/llenarFormaPago", "", false, function (lstFP) {
        var ObjFP;
        var cbFP = $('#cbFormaPago');
        cbFP.empty();
        for (var i = 0; i < lstFP.length; i++) {
            ObjFP = lstFP[i];

            cbFP.append(
                "<option value=" + ObjFP.clave + ">" + ObjFP.clave + " - " + ObjFP.descripcion + "</option>"
            );
        }
        cbFP.val('99').prop('selected', true);
        return false;
    });
    return false;
}

function fillComboEstado(id_pais, combo_e) {
    GetAjax("../wsUbicacion.asmx/llenarCbEstados", "'id':" + id_pais, false, function (lstEstado) {
        var ObjEstado;
        var ObjcbEstado = combo_e;
        ObjcbEstado.empty();
        for (var i = 0; i < lstEstado.length; i++) {
            ObjEstado = lstEstado[i];

            ObjcbEstado.append(
                "<option value=" + ObjEstado.id + ">" + ObjEstado.fullname + "</option>"
            );
        }
        return false;
    });
    return false;
}

function fillComboCiudad(id_ciudad, combo_c) {
    GetAjax("../wsUbicacion.asmx/llenarCbCiudades", "'id':" + id_ciudad, false, function (lstEstado) {
        var ObjCiudad;
        var ComboCiudad = combo_c;
        ComboCiudad.empty();
        for (var i = 0; i < lstEstado.length; i++) {
            ObjCiudad = lstEstado[i];

            ComboCiudad.append(
                "<option value=" + ObjCiudad.id + ">" + ObjCiudad.fullname + "</option>"
            );
        }
        return false;
    });
    return false;
}


