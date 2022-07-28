
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />



$(document).ready(function () {

    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    
       
    var contador = 0;


    //Alamcenar informacion de contacto
    $('#btnContactoCompañia').on('click', function () {
        var nombre = $('#txtNombrCont');
        var puesto = $('#txtpuestoCont');
        var correo = $('#txtCorreoCont');
        var ext = $('#txtExtCont');
        var tel = $('#txtTelCont');
        var cel = $('#txtCelCont');
        var check="";

       if( $('#cbContactoFactura').is(':checked')){
           check =
               '<div class="form-check">' +
               '<input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>' +
               '</div>';
        }

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
                    "<td><span>" + check + "</span></td>" +
                    "<td><button type='button'class='btn btn-danger btn-sm' name='remove' id='remove' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
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
    $(document).on('click', '#remove', function () {
       
        $(this).parent().closest("tr").remove();
        contador--;
    });




    //Almacenar informacion de compañia filial en la tabla
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

    //Cambio en l tipo de persona ante el SAT
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

    //cambio en eel combo de Pais de compañia
    $("#cbPais").change(function () {
        var PaisSeleccionado = $('#cbPais option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cboEstado'));

        $('#cbCiudad').empty();
        $('#cbPais option[value=0]').remove();


    });

    //cambio en el combobox de Estado de compañia
    $("#cboEstado").change(function () {
        var EstadoSeleccionado = $('#cboEstado option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudad'));
    });

    //cambio en combobox del Pais de dirccion d facturacion
    $("#cbPaisFact").change(function () {
        var PaisSeleccionado = $('#cbPaisFact option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cbEstadoFact'));

        $('#cbCiudadFact').empty();
        $('#cbPaisFact option[value=0]').remove();

    });

        //Cambio de opcion en combobox del Estado de dirccion de facturacion
    $("#cbEstadoFact").change(function () {
        var EstadoSeleccionado = $('#cbEstadoFact option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudadFact'));
    });

     //Cambio de opcion en combobox del Pais de Compañia filial
    $("#cbPaisComFilial").change(function () {
        var PaisSeleccionado = $('#cbPaisComFilial option:selected').val();

        fillComboEstado(PaisSeleccionado, $('#cboEstadoComFilial'));

        $('#cbPaisComFilial option[value=0]').remove();
        $('#cbCiudadComFilial').empty();
    });

    //Cambio de opcion en combobox del Estado de Compañia filial
    $("#cboEstadoComFilial").change(function () {
        var EstadoSeleccionado = $('#cboEstadoComFilial option:selected').val();

        fillComboCiudad(EstadoSeleccionado, $('#cbCiudadComFilial'));
    });

    //CheckBox para ver si la dirccion es la misma
    $('#chkDireccionIgual').change(function () {
        if ($(this).is(':checked')) {                     

            $('#DirFra *').prop('disabled', false);
            $('#DirFra').css('background-color', 'white');
        } else {
            $('#DirFra *').prop('disabled', true);
            $('#DirFra').css('background-color','#e9ecef');

        }
    });

      //creacion de cookie que el tipo de rgistro para no mostrar algunas paginas
    $('#cbTipoDeRegistro').change(function () {
        var tipo = $('#cbTipoDeRegistro option:selected').val();
    
         //creacion de cookie que el tipo de rgistro para no mostrar algunas paginas
        switch (tipo) {
            case 'cliente':
                sessionStorage.setItem('ctipo', 'cliente');
                $('#wizard').prop('hidden', false);
                $('#wizard2').prop('hidden', true);
                break;
            case 'proveedor':
                sessionStorage.setItem('ctipo', 'proveedor');
                $('#wizard2').prop('hidden', false);
                $('#wizard').prop('hidden', true);
                break;
        }


    });

   
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


function alertameEsta() {
    alert('esta 😆🤙');
}
