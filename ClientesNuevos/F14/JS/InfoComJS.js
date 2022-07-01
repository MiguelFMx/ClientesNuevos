
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />


$(document).ready(function () {
    var contador = 0;

    $('#btnContactoCompañia').click(function () {
        if (contador <= 2) {
            contador++;
            //tContactoCom
            var nombre = $('#txtNombrCont');
            var puesto = $('#txtpuestoCont');
            var correo = $('#txtCorreoCont');
            var ext = $('#txtExtCont');
            var tel = $('#txtTelCont');
            var cel = $('#txtCelCont');

            var tabla = $('#tContactoCom tbody');

            tabla.append(
                "<tr>" +
                "<td><span>" + nombre.val() + "</span></td>" +
                "<td><span>" + puesto.val() + "</span></td>" +
                "<td><span>" + correo.val() + "</span></td>" +
                "<td><span>" + ext.val() + "</span></td>" +
                "<td><span>" + tel.val() + "</span></td>" +
                "<td><span>" + cel.val() + "</span></td>" +
                "<td><button type='button'class='btn btn-danger' name='remove' id='remove' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
                "</tr>"
            );
            nombre.val(""); puesto.val(""); correo.val(""); ext.val(""); tel.val(""); cel.val("");

            nombre.focus();
        } else {
            alert("Solo se pueden registrar 3 contactos");
        }

    });
    $(document).on('click', '#remove', function () {
       
        $(this).parent().closest("tr").remove();
        contador--;
    });


    $("#cbPais").change(function () {
        var PaisSeleccionado = $('#cbPais option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cboEstado'));

        $("#cbPaisFact option[value='" + PaisSeleccionado + "']").prop('selected', true);
    });

    $("#cboEstado").change(function () {
        var EstadoSeleccionado = $('#cboEstado option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudad'));
    });


    $("#cbPaisFact").change(function () {
        var PaisSeleccionado = $('#cbPaisFact option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cbEstadoFact'));
    });

    $("#cbEstadoFact").change(function () {
        var EstadoSeleccionado = $('#cbEstadoFact option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudadFact'));
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
        for (var i = 0; i < lstPais.length; i++) {
            ObjPais = lstPais[i];

            ObjcbPais.append(
                "<option value=" + ObjPais.id + ">" + ObjPais.fullname + "</option>"                       
            );
        }
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

