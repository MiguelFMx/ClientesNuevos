﻿
/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />



$(document).ready(function () {

    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    
       
    var contador = 0;
    $('#MainContent_btnSimularJS').click(function () {
        alert("Diste click :D");
    })

    //Alamcenar informacion de contacto
    $('#btnContactoCompania').on('click', function () {
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

        if (nombre.val() != "" && puesto.val() != "" && correo.val() != "" && tel.val() != "" && cel.val() != "") {
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
            if (nombre.val() == '') {
                $('#sNombre').html('Es necesario que llene este campo');
            }

        }
    });

    $('#MainContent_btnContact').click(function () {
        var nombre = $('#txtNombrCont');
        var puesto = $('#txtpuestoCont');
        var correo = $('#txtCorreoCont');
        var ext = $('#txtExtCont');
        var tel = $('#txtTelCont');
        var cel = $('#txtCelCont');
        var rfc = $('#MainContent_txtRfc');
        var tipo = "";

        if ($('#cbContactoFactura').is(':checked')) {
            tipo = "Fra";
        } else {
            tipo = "Comp";
        }
        if (nombre.val() != "" && puesto.val() != "" && correo.val() != "" && tel.val() != "" && cel.val() != "") {
            GetAjax("../wsBaseDatos.asmx/LlenarContacto",
                "'Nombre':'" + nombre.val() + "'," +
                "'Puesto':'" + puesto.val() + "'," +
                "'Telefono':'" + tel.val() + "'," +
                "'Extension':'" + ext.val() + "'," +
                "'Celular':'" + cel.val() + "'," +
                "'Correo':'" + correo.val() + "'," +
                "'Tipo':'" + tipo + "'," +
                "'ID_compania':'" + rfc.val() + "'", false,
                function (resultado) {

                    alert(resultado);
                    CargarContactos();
                    return false;
                });
            nombre.val(""); puesto.val(""); correo.val(""); ext.val(""); tel.val(""); cel.val("");
            $('#sNombre').html('');
            $('#sPuesto').html('');
            $('#sCorreo').html('');
            $('#sTelefono').html('');
            $('#sCelular').html('');

            nombre.focus();
        } else {
            if (nombre.val() == '') {
                $('#sNombre').html('*campo obligatorio');
            }
            if (puesto.val() == '') {
                $('#sPuesto').html('*campo obligatorio');
            }
            if (correo.val() == '') {
                $('#sCorreo').html('*campo obligatorio');
            }
            if (tel.val() == '') {
                $('#sTelefono').html('*campo obligatorio');
            }
            if (cel.val() == '') {
                $('#sCelular').html('*campo obligatorio');
            }
        }
        return false;
    });

    $(document).on('click', '#remove', function () {
        let id = $('#MainContent_txtRfc');

        var id_contacto = $(this).closest('tr').find('.index').text();

        let pregunta = confirm('¿Seguro que desea eliminar este contacto?');

        if (pregunta ==true) {
            GetAjax("../wsBaseDatos.asmx/BorrarContacto", "'index':'" + id_contacto + "'", false, function (msg) {
                alert(msg);
            });

            $(this).parent().closest("tr").remove();
            contador--;

            CargarContactos(id.val());
        }
        
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

    $('#MainContent_txtRfc').keyup(function () {
        var texto = $('#MainContent_txtRfc').val();

        GetAjax("../wsBaseDatos.asmx/ExisteComp", "'rfc':'"+ texto + "'", false, function (res) {
            if (res == "si") {
                $('#sExtiste').html('Ya existe un registro con este RFC/W9');
            } else {
                $('#sExtiste').empty();

            }
        });

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


function CargarContactos() {
    var tabla = $('#tContactoCom tbody');
    var check;


    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });

    GetAjax("../wsBaseDatos.asmx/getContacto",
        "'id':'" + id_cuenta + "'"
        , false,
        function (lstContacto) {

            if (lstContacto.length > 0) {
                tabla.empty();

                for (var i = 0; i < lstContacto.length; i++) {
                    if (lstContacto[i].Tipo == "Fra") {
                        check =
                            '<div class="form-check">' +
                            '<input class="form-check-input" type="checkbox" value="" id="flexCheckCheckedDisabled" checked disabled>' +
                            '</div>';
                    } else {
                        check = " ";
                    }
                    tabla.append(
                        "<tr>" +
                        "<td class='index' hidden><span>" + lstContacto[i].ID + "</span></td>" +
                        "<td><span>" + lstContacto[i].Nombre + "</span></td>" +
                        "<td><span>" + lstContacto[i].Puesto + "</span></td>" +
                        "<td><span>" + lstContacto[i].Correo + "</span></td>" +
                        "<td><span>" + lstContacto[i].Telefono + "</span></td>" +
                        "<td><span>" + lstContacto[i].Extension + "</span></td>" +
                        "<td><span>" + lstContacto[i].Celular + "</span></td>" +
                        "<td><span>" + check + "</span></td>" +
                        "<td><button type='button'class='btn btn-danger' name='remove' id='remove' style='border-radius:42px;'><i class='fas fa-minus-circle'></i></button></td></tr>" +
                        "</tr>"
                    );
                }
            } else {
                tabla.empty();
                tabla.append("<tr><td colspan='9' style='text-align:center;' ><span class='text-secondary'>No hay registros</span></td></tr>");
            }

            return false;
        });
    return false;
}


function MensajeError(mensaje) {
    //let urlParams = new URLSearchParams(window.location.search);
    //let acomp = urlParams.get('rfc');
    //let accion = urlParams.get('accion');
    //var rfc = $('MainContent_txtRfc').val();
    Swal.fire({
        icon: "error",
        title: "Oops...",
        html: mensaje
    });
    //Swal.fire({
    //    icon: 'warning',
    //    html: mensaje,
    //    showCancelButton: true,
    //    confirmButtonColor: '#3085d6',
    //    cancelButtonColor: '#d33',
    //    confirmButtonText: 'si',
    //    cancelButtonText: 'no'
    //}).then((result) => {
    //    if (result.isConfirmed) {

    //        if (acomp == null) {
    //            if (accion == null) {
    //                window.location.href = '../Secciones/AgentesAduanales.aspx';

    //            } else {
    //                window.location.href = '../Secciones/AgentesAduanales.aspx?rfc=' + rfc;

    //            }

    //        } else {
    //            if (accion == null) {
    //                window.location.href = '../Secciones/AgentesAduanales.aspx?rfc=' + acomp;

    //            } else {
    //                window.location.href = '../Secciones/AgentesAduanales.aspx?accion=new&rfc=' + acomp;

    //            }

    //        }
    //    }
    //});    
}

function ExisteRFC() {
    Swal.fire({
        icon: 'warning',
        html: 'Ya existe un registro con el RFC/W9 especificado<br>Intentelo con otro',
        timer: 2500,
        timerProgressBar: true,
        showConfirmButton:false
        })
}
function MensajeSucces() {
    let urlParams = new URLSearchParams(window.location.search);
    let acomp = urlParams.get('rfc');
    let accion = urlParams.get('accion');

    Swal.fire({
        icon: 'success',
        html: 'Informacion registrada con exito',
        timer: 2000,
        timerProgressBar: true,
        showConfirmButton: false,
        willClose: () => {
            if (acomp == null) {
                if (accion == null) {
                    window.location.href = '../Secciones/AgentesAduanales.aspx';

                } else {
                    window.location.href = '../Secciones/AgentesAduanales.aspx?rfc=' + rfc;

                }

            } else {
                if (accion == null) {
                    window.location.href = '../Secciones/AgentesAduanales.aspx?rfc=' + acomp;

                } else {
                    window.location.href = '../Secciones/AgentesAduanales.aspx?accion=new&rfc=' + acomp;

                }

            }
        }
        })
}