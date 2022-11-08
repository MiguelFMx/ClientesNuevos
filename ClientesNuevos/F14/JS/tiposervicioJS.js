/// <reference path="../../scripts/js/ajax.js" />
/// <reference path="../../scripts/jquery-3.6.0.min.js" />

var count = 1;

$(document).ready(function () {

    let urlParams = new URLSearchParams(window.location.search);
    let acomp = urlParams.get('id');

    if (acomp == null) {
        ObtenerProducto();
        ObtenerServicio();

    } else {
        ObtenerProductoAdmin();
        ObtenerServicioAdmin();
    }


    

//Almacenaje
    $('#chkAlmacenaje').change(function () {
        if (this.checked) {
            $('#opcionesAlmacenaje').toggle('fast');

            $('#chkMPAlmacenaje').change(function () {
                if (this.checked) {
                    $('#MPAlmacenaje').show('fast');
                } else {
                    $('#MPAlmacenaje').hide('fast');
                }
            })

        } else {
            $('#opcionesAlmacenaje').hide('fast');
            $("#chkADAlmacenaje").prop("checked", false);
            $("#chkIBAlmacenaje").prop("checked", false);
            $("#chkMPAlmacenaje").prop("checked", false);
            $("#chkMPQuimicosAlmacenaje").prop("checked", false);
            $("#chkMPCarbonAlmacenaje").prop("checked", false);
            $("#chkTransbordoAlmacenaje").prop("checked", false);
            $('#MPAlmacenaje').hide('fast');
        }
    });

    //Exportacion  opcionesRenta
    $('#chkExportacion').change(function () {
        if (this.checked) {
            $('#opcionesExpo').show('fast');

            $('#chkMPExpo').change(function () {
                if (this.checked) {
                    $('#MPExpo').show('fast');
                } else {
                    $('#MPExpo').hide('fast');
                }
            })

        } else {
            $('#opcionesExpo').hide('fast');
            $("#chkExpoCS").prop("checked", false);
            $("#chkFrrExpo").prop("checked", false);
            $("#chkIBExpo").prop("checked", false);
            $("#chkMPExpo").prop("checked", false);
            $("#chkMPQuimicosExpo").prop("checked", false);
            $("#chkMPCarbonExpo").prop("checked", false);
            $('#MPExpo').hide('fast');
        }
    });

    $('#chkRE').change(function () {
        if (this.checked) {
            $('#opcionesRenta').show('fast');

        } else {
            $('#opcionesRenta').hide('fast');
            $("#chkRntaCajas").prop("checked", false);
            $("#chkRentaSD").prop("checked", false);
            
        }
    });

    //Importacion
    $('#chkImportacion').change(function () {
        if (this.checked) {
            $('#opcionesImpo').show('fast');

            $('#chkMPImpo').change(function () {
                if (this.checked) {
                    $('#MPImpo').show('fast');
                } else {
                    $('#MPImpo').hide('fast');
                }
            })

        } else {
            $('#opcionesImpo').hide('fast');
            $("#chkImpoCS").prop("checked", false);
            $("#chkFrrImpo").prop("checked", false);
            $("#chkIBImpo").prop("checked", false);
            $("#chkMPImpo").prop("checked", false);
            $("#chkMPQuimicosImpo").prop("checked", false);
            $("#chkMPCarbonImpo").prop("checked", false);
            $('#MPImpo').hide('fast');
        }
    });

    //Transportacion
    $('#chkTransportacion').change(function () {
        if (this.checked) {
            $('#opcionesTransport').show('fast');

            $('#chkMPTransport').change(function () {
                if (this.checked) {
                    $('#MPTransport').show('fast');
                } else {
                    $('#MPTransport').hide('fast');
                }
            })

        } else {
            $('#opcionesTransport').hide('fast');
            $("#chkTransportCS").prop("checked", false);
            $("#chkIBTransport").prop("checked", false);
            $("#chkMPTransport").prop("checked", false);
            $("#chkMPQuimicosTransport").prop("checked", false);
            $("#chkMPCarbonTransport").prop("checked", false);
            $('#MPTransport').hide('fast');
        }
    });

    //otro
    $('#chkOtro').change(function () {
        if (this.checked) {
            $('#textoOtro').show('fast');
                       
        } else {
            $('#textoOtro').hide('fast');
            $('#txtOtro').val("");
        }
    });

    //Tabla de informacion de productos-------------------------------------------------------------------------------------------------
   
    //dynamic_field(count);

   

    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();
    });
    //boton------------------------------------------------------------------------------------------------------------------------------

   
    $('#btnContinuar').click(function () {
        var servicio, producto;
        var id;
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                id = res;
            });
       
        producto = GuardarProducto();
        servicio = GuardarServicio();

        if (producto == '' && servicio == '') {
           
            GetAjax("../wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F14', 'Ruta':'null','Estatus':'80%'", false, function (res) {
                console.log(res);
            });

            window.location.href = 'InformacionCadenaSuministro.aspx?res=Exito';
        } else {
            if (servicio!='') {
                //alert('Llene los campos necesarios');
                $('#errorServicio').html('<div class="alert alert-warning" role="alert">' +
                    '<div class="row">' +
                    '<div class="col"><h5 class="alert-heading"><i class="bi bi-exclamation-triangle-fill"></i> Error</h5></div>' +
                    '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
                    '</div>' +
                    '<div class="row">' + servicio + '</div>' +
                    '</div>');
            }
        }
        
       
    });
});

function Almacenar(grupo, subgrupo, idcompania) {
    GetAjax("../wsBaseDatos.asmx/insertar_servicio", "'id_compania':'" + idcompania + "','grupo':'" + grupo + "', 'subgrupo':'" + subgrupo+"'", false, function (resultado) {
        console.log(resultado + "   " + grupo + ":" + subgrupo);
        return false;
    });
    return false;
}

function GuardarProducto() {

    let arrDescripcion = [];
    let arrComentarios = [];
    let aux = 1;
    let aux2 = 1;
    let aux3 = 0;
    let rsult;
    $('#error').html('');

    let strerror = '';

    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
        });
    GetAjax("../wsBaseDatos.asmx/EncontrarEliminar", "'ID_Compania':'" + id_cuenta + "','tabla':'Table_mercancia'", false, function (str) {
        console.log(str);
    });


    $('input[name=Descripcion]').each(function () {
        if ($(this).val() == '') {
            strerror += '<p>Ingrese la descripcion de la fila ' + aux + '</p>';
        } else {
            arrDescripcion.push($(this).val());
        }
        aux = aux + 1;
       
    });

    $('input[name=Comentarios]').each(function () {
        if ($(this).val() == '') {
            strerror += '<p>Ingrese el comentario de la fila ' + aux2 + '</p>';
        } else {
            arrComentarios.push($(this).val());
        }
        aux2 = aux2 + 1;
    });

    if (strerror == '') {
        
        for (var i = 0; i < arrDescripcion.length; i++) {

            GetAjax("../wsBaseDatos.asmx/Insertar_Productos", "'ID_compania':'" + id_cuenta + "','descripcion':'" + arrDescripcion[i] + "','comentarios':'" + arrComentarios[i] + "'", false, function (res) {
                aux3 = aux3 + 1;
            });
        }

        console.log("Datos registrado " + aux3);

        rsult = '';
    } else {
        $('#error').html(
            '<div class="alert alert-warning" role="alert">' +
            '<div class="row">' +
            '<div class="col"><h5 class="alert-heading"><i class="bi bi-exclamation-triangle-fill"></i> Error</h5></div>' +
            '<div class="col" style="display:flex; justify-content:flex-end;"><button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></div>' +
            '</div>' +
            '<div class="row">' + strerror + '</div>' +
            '</div>');
        rsult = 'error';
    }

    return rsult;

}

function GuardarServicio() {
    var cookie = "";
    var result='';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            cookie = res;
        });

    GetAjax("../wsBaseDatos.asmx/EncontrarEliminar", "'ID_Compania':'" + cookie + "','tabla':'Table_Servicios'", false, function (str) {
        console.log(str);
    });

    if ($('#chkAlmacenaje').is(':checked') || $('#chkExportacion').is(':checked') || $('#chkImportacion').is(':checked') || $('#chkRE').is(':checked') || $('#chkTransportacion').is(':checked') || $('#chkAgnciaAduanalMexicana').is(':checked') || $('#chkOtro').is(':checked')) {
        //---------------------Almacenaje--------------------------------------------------------------
        if ($('#chkAlmacenaje').is(':checked')) {
            //opciones
            if ($('#chkADAlmacenaje').is(':checked') || $('#chkIBAlmacenaje').is(':checked') || $('#chkTransbordoAlmacenaje').is(':checked') || $('#chkMPAlmacenaje').is(':checked')) {
                if ($('#chkADAlmacenaje').is(':checked')) {
                    Almacenar('Almacenaje', 'Almacen de deposito', cookie);
                }
                if ($('#chkIBAlmacenaje').is(':checked')) {
                    Almacenar('Almacenaje', 'In-bonds', cookie);
                }
                if ($('#chkTransbordoAlmacenaje').is(':checked')) {
                    Almacenar('Almacenaje', 'Transbordo', cookie);
                }
                if ($('#chkMPAlmacenaje').is(':checked')) {
                    if ($('#chkMPQuimicosAlmacenaje').is(':checked') && $('#chkMPCarbonAlmacenaje').is(':checked') == false) {
                        Almacenar('Almacenaje', '1', cookie);
                    } else if ($('#chkMPCarbonAlmacenaje').is(':checked') && $('#chkMPQuimicosAlmacenaje').is(':checked') == false) {
                        Almacenar('Almacenaje', '2', cookie);
                    } else if ($('#chkMPQuimicosAlmacenaje').is(':checked') && $('#chkMPCarbonAlmacenaje').is(':checked')) {
                        Almacenar('Almacenaje', '3', cookie);
                    } else {
                        result += '<p>No selecciono tipo de material peligroso del servicio de almacenaje</p>';
                    }
                }
            } else {
                result += '<p>Selecionó el servicio de Almacenaje, pero no ha especificado el tipo de servicio</p>';
            }
        }

        //---------------------Exportacion--------------------------------------------------------------
        if ($('#chkExportacion').is(':checked')) {
            //servicios
            if ($('#chkExpoCS').is(':checked') || $('#chkFrrExpo').is(':checked') || $('#chkIBExpo').is(':checked') || $('#chkMPExpo').is(':checked')) {
                if ($('#chkExpoCS').is(':checked')) {
                    Almacenar('Exportacion', 'Carga seca', cookie);
                }
                if ($('#chkFrrExpo').is(':checked')) {
                    Almacenar('Exportacion', 'Ferrocarril', cookie);
                }
                if ($('#chkIBExpo').is(':checked')) {
                    Almacenar('Exportacion', 'In-bonds', cookie);
                }
                if ($('#chkMPExpo').is(':checked')) {//Material peligroso
                    if ($('#chkMPQuimicosExpo').is(':checked') && $('#chkMPCarbonExpo').is(':checked') == false) {
                        Almacenar('Exportacion', '1', cookie);
                    } else if ($('#chkMPCarbonExpo').is(':checked') && $('#chkMPQuimicosExpo').is(':checked') == false) {
                        Almacenar('Exportacion', '2', cookie);
                    }
                    else if ($('#chkMPQuimicosExpo').is(':checked') && $('#chkMPCarbonExpo').is(':checked')) {
                        Almacenar('Exportacion', '3', cookie);
                    } else {
                        result += '<p>No selecciono el tipo de material peligroso del servicio de exportacion</p>';
                    }
                }
            } else {
                result += '<p>Seleccionó el servicio de exportación, pero no ha especificado el tipo de servicio</p>';
            }
        }
        //-------------------Importacion-------------------------------------------------------------------
        if ($('#chkImportacion').is(':checked')) {
            if ($('#chkImpoCS').is(':checked') || $('#chkFrrImpo').is(':checked') || $('#chkIBImpo').is(':checked') || $('#chkMPImpo').is(':checked')) {

                if ($('#chkImpoCS').is(':checked')) {
                    Almacenar('Importacion', 'Carga seca', cookie);
                }
                if ($('#chkFrrImpo').is(':checked')) {
                    Almacenar('Importacion', 'Ferrocarril', cookie);
                }
                if ($('#chkIBImpo').is(':checked')) {
                    Almacenar('Importacion', 'In-bonds', cookie);
                }
                if ($('#chkMPImpo').is(':checked')) {
                    if ($('#chkMPQuimicosImpo').is(':checked') && $('#chkMPCarbonImpo').is(':checked') == false) {
                        Almacenar('Importacion', '1', cookie);
                    } else if ($('#chkMPCarbonImpo').is(':checked') && $('#chkMPQuimicosImpo').is(':checked') == false) {
                        Almacenar('Importacion', '2', cookie);
                    } else if ($('#chkMPQuimicosImpo').is(':checked') && $('#chkMPCarbonImpo').is(':checked')) {
                        Almacenar('Importacion', '3', cookie);
                    } else {
                        result += '<p>No selecciono el tipo de material peligroso del servicio de importacion</p>';
                    }                
                }

            } else {
                result += '<p>Seleccionó el servicio de importación, pero no ha especificado el tipo de servicio</p>';
            }
        }
        //-------------------Renta de equipo---------------------------------------------------------------
        if ($('#chkRE').is(':checked')) {
            if ($('#chkRntaCajas').is(':checked') && $('#chkRentaSD').is(':checked') == false) { //renta de cajas
                Almacenar('Renta de equipo', '4', cookie);
            } else if ($('#chkRentaSD').is(':checked') && $('#chkRntaCajas').is(':checked') == false) {//Servicio dedicado
                Almacenar('Renta de equipo', '5', cookie);
            } else if ($('#chkRntaCajas').is(':checked') && $('#chkRentaSD').is(':checked')) { //renta de cajas y servicio dedicado
                Almacenar('Renta de equipo', '6', cookie);
            } else {
                result += '<p>Seleccionó el servicio de renta de equipos, pero no ha especificado el tipo de servicio</p>';
            }
        }
        //-------------------Transportacion---------------------------------------------------------------
        if ($('#chkTransportacion').is(':checked')) {
            if ($('#chkTransportCS').is(':checked') || $('#chkIBTransport').is(':checked') || $('#chkMPTransport').is(':checked')) {
                if ($('#chkTransportCS').is(':checked')) {
                    Almacenar('Transportacion', 'Carga seca', cookie);
                }
                if ($('#chkIBTransport').is(':checked')) {
                    Almacenar('Transportacion', 'In-bonds', cookie);
                }
                if ($('#chkMPTransport').is(':checked')) {
                    if ($('#chkMPQuimicosTransport').is(':checked') && $('#chkMPCarbonTransport').is(':checked') == false) {
                        Almacenar('Transportacion', '1', cookie);
                    } else if ($('#chkMPCarbonTransport').is(':checked') && $('#chkMPQuimicosTransport').is(':checked') == false) {
                        Almacenar('Transportacion', '2', cookie);
                    } else if ($('#chkMPQuimicosTransport').is(':checked') && $('#chkMPCarbonTransport').is(':checked')) {
                        Almacenar('Transportacion', '3', cookie);
                    } else {
                        result += '<p>Selecciono el servicio de material peligroso en transportación pero no ha especificado el tipo de material</p>';
                    }
                }
            } else {
                result += '<p>Selecciono el servicio de transportacion, pero no ha especificado el tipo de servicio</p>';
            }
        }
        //-------------------Agencia aduanal-------------------------------------------------------------------
        if ($('#chkAgnciaAduanalMexicana').is(':checked')) {
            Almacenar('Agencia aduanal mexicana', '', cookie);
        }
        //-------------------logistica--------------------------------------------------------------------------
        if ($('#chkLogistica').is(':checked')) {
            Almacenar('Logistica', '', cookie);
        }
        //-------------------Otro-------------------------------------------------------------------------------
        if ($('#chkOtro').is(':checked')) {
            var servicio = $('#txtOtro').val();
            if (servicio != '') {
                Almacenar('otro', servicio, cookie);
            } else {
                result += '<p>Seleccionó otro, especifique el tipo de servicio que requiere</p>';
            }
        }
    } else {
        result +='<p>No ha seleccionado ningún servicio</p>';
    }

    return result;
}


function ObtenerProducto() {
    let descrip;
    let commnt;
    let comp;
    let aux;
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            comp = res;
        });
    GetAjax("../wsBaseDatos.asmx/Obtener_Productos", "'ID_compania':'" + comp + "'", false, function (producto) {
        if (producto.length > 0) {
            for (var i = 0; i < producto.length; i++) {
                descrip = producto[i].Descripcion;
                commnt = producto[i].Comentarios;
                aux = i + 1;
                var html = '<tr>';
                html += '<th><label>' +aux + '</label></th>';
                html += '<td><div class="col"><input type="text" name="Descripcion" class="form-control descripcion" value="' + descrip + '"></div></td>';
                html += '<td><div class="col"><input type="text" name="Comentarios" class="form-control comentarios" value="' + commnt + '"></div></td>';

                if (aux > 1) {
                    html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').append(html);
                } else {
                    html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').html(html);
                }
                count = aux;
            }
        } else {
            dynamic_field(1);
           
        }

    });
}


function ObtenerProductoAdmin() {
    let descrip;
    let commnt;
    let aux;

    let urlParams = new URLSearchParams(window.location.search);
    let compa = urlParams.get('id');

    GetAjax("../wsBaseDatos.asmx/Obtener_Productos", "'ID_compania':'" + compa + "'", false, function (producto) {
        if (producto.length > 0) {
            for (var i = 0; i < producto.length; i++) {
                descrip = producto[i].Descripcion;
                commnt = producto[i].Comentarios;
                aux = i + 1;
                var html = '<tr>';
                html += '<th><label>' + aux + '</label></th>';
                html += '<td><div class="col"><input type="text" name="Descripcion" class="form-control descripcion" value="' + descrip + '"></div></td>';
                html += '<td><div class="col"><input type="text" name="Comentarios" class="form-control comentarios" value="' + commnt + '"></div></td>';

                if (aux > 1) {
                    html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').append(html);
                } else {
                    html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').html(html);
                }
                count = aux;
            }
        } else {
            dynamic_field(1);

        }

    });
}

function ObtenerServicioAdmin() {
    let sub_grupo;
    let grupo;

    let urlParams = new URLSearchParams(window.location.search);
    let compa = urlParams.get('id');
   

    GetAjax("../wsBaseDatos.asmx/Obtener_Servicios", "'ID_compania':'" + compa + "'", false, function (servicio) {
        let Almacenaje = 0, Almacenajemp = 0, Export = 0, Exportmp = 0, Import = 0, ImportMP = 0, RE = 0, transport = 0, transportMP = 0, Otro = 0;
        if (servicio.length > 0) {
            for (var i = 0; i < servicio.length; i++) {
                grupo = servicio[i].GrupoPrincipal;
                sub_grupo = servicio[i].SubGrupo;

                switch (grupo) {

                    case 'Almacenaje':
                        Almacenaje = 1;
                        $('#chkAlmacenaje').prop('checked', true);

                        if (sub_grupo == 'Almacen de deposito') {
                            $('#chkADAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == 'Transbordo') {
                            $('#chkTransbordoAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);
                            $('#chkMPQuimicosAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);

                            $('#chkMPCarbonAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);

                            $('#chkMPQuimicosAlmacenaje').prop('checked', true);
                            $('#chkMPCarbonAlmacenaje').prop('checked', true);
                        }
                        break;
                    case 'Exportacion':
                        Export = 1;
                        $('#chkExportacion').prop('checked', true);

                        if (sub_grupo == 'Carga seca') {
                            $('#chkExpoCS').prop('checked', true);
                        }
                        if (sub_grupo == 'Ferrocarril') {
                            $('#chkFrrExpo').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBExpo').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPQuimicosExpo').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPCarbonExpo').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPQuimicosExpo').prop('checked', true);
                            $('#chkMPCarbonExpo').prop('checked', true);
                        }

                        break;
                    case 'Importacion':
                        Import = 1;
                        $('#chkImportacion').prop('checked', true);
                        if (sub_grupo = 'Carga seca') {
                            $('#chkImpoCS').prop('checked', true);
                        }
                        if (sub_grupo = 'Ferrocarril') {
                            $('#chkFrrImpo').prop('checked', true);
                        }
                        if (sub_grupo = 'In-bonds') {
                            $('#chkIBImpo').prop('checked', true);
                        }
                        if (sub_grupo = '1') {
                            ImportMP = 1;
                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPQuimicosImpo').prop('checked', true);
                        }
                        if (sub_grupo = '2') {
                            ImportMP = 1;

                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPCarbonImpo').prop('checked', true);
                        }
                        if (sub_grupo = '3') {
                            ImportMP = 1;
                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPQuimicosImpo').prop('checked', true);
                            $('#chkMPCarbonImpo').prop('checked', true);

                        }
                        break;
                    case 'Renta de equipo':
                        RE = 1;
                        $('#chkRE').prop('checked', true);

                        if (sub_grupo == '4') {
                            $('#chkRntaCajas').prop('checked', true);
                        }
                        if (sub_grupo == '5') {
                            $('#chkRentaSD').prop('checked', true);

                        }
                        if (sub_grupo == '6') {
                            $('#chkRntaCajas').prop('checked', true);
                            $('#chkRentaSD').prop('checked', true);

                        }
                        break;
                    case 'Transportacion':
                        transport = 1;
                        $('#chkTransportacion').prop('checked', true);

                        if (sub_grupo == 'Carga seca') {
                            $('#chkTransportCS').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBTransport').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPQuimicosTransport').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPCarbonTransport').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPQuimicosTransport').prop('checked', true);
                            $('#chkMPCarbonTransport').prop('checked', true);
                        }
                        break;
                    case 'Agencia aduanal mexicana':
                        $('#chkLogistica').prop('checked', true);
                        break;
                    case 'Logistica':
                        $('#chkLogistica').prop('checked', true);
                        break;
                    case 'otro':
                        $('#chkOtro').prop('checked', true);
                        $('#txtOtro').val(sub_grupo);
                        Otro = 1;
                        break;

                }

            }

            if (Almacenaje == 1) {
                $('#opcionesAlmacenaje').toggle();
            }
            if (Almacenajemp == 1) {
                $('#MPAlmacenaje').show();
            }
            if (Export == 1) {
                $('#opcionesExpo').show();
            }
            if (Exportmp == 1) {
                $('#MPExpo').show();
            }
            if (Import == 1) {
                $('#opcionesImpo').show();
            }
            if (ImportMP == 1) {
                $('#MPImpo').show();
            }
            if (RE == 1) {
                $('#opcionesRenta').show();
            }
            if (transport == 1) {
                $('#opcionesTransport').show();
            }
            if (transportMP == 1) {
                $('#MPTransport').show();
            }
            if (Otro == 1) {
                $('#textoOtro').show();
            }
        }

    });
}

function ObtenerServicio() {
    let sub_grupo;
    let grupo;

    let comp;
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            comp = res;
        });

    GetAjax("../wsBaseDatos.asmx/Obtener_Servicios", "'ID_compania':'" + comp + "'", false, function (servicio) {
        let Almacenaje = 0, Almacenajemp = 0, Export = 0, Exportmp = 0, Import = 0, ImportMP = 0, RE = 0, transport = 0, transportMP = 0, Otro = 0;
        if (servicio.length > 0) {
            for (var i = 0; i < servicio.length; i++) {
                grupo = servicio[i].GrupoPrincipal;
                sub_grupo = servicio[i].SubGrupo;

                switch (grupo) {

                    case 'Almacenaje':
                        Almacenaje = 1;
                        $('#chkAlmacenaje').prop('checked', true);

                        if (sub_grupo == 'Almacen de deposito') {
                            $('#chkADAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == 'Transbordo') {
                            $('#chkTransbordoAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);
                            $('#chkMPQuimicosAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);

                            $('#chkMPCarbonAlmacenaje').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            Almacenajemp = 1;
                            $('#chkMPAlmacenaje').prop('checked', true);

                            $('#chkMPQuimicosAlmacenaje').prop('checked', true);
                            $('#chkMPCarbonAlmacenaje').prop('checked', true);
                        }
                        break;
                    case 'Exportacion':
                        Export = 1;
                        $('#chkExportacion').prop('checked', true);

                        if (sub_grupo == 'Carga seca') {
                            $('#chkExpoCS').prop('checked', true);
                        }
                        if (sub_grupo == 'Ferrocarril') {
                            $('#chkFrrExpo').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBExpo').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPQuimicosExpo').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPCarbonExpo').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            $('#chkMPExpo').prop('checked', true);
                            $('#chkMPQuimicosExpo').prop('checked', true);
                            $('#chkMPCarbonExpo').prop('checked', true);
                        }
                        
                        break;
                    case 'Importacion':
                        Import = 1;
                        $('#chkImportacion').prop('checked', true);
                        if (sub_grupo = 'Carga seca') {
                            $('#chkImpoCS').prop('checked', true);
                        }
                        if (sub_grupo = 'Ferrocarril') {
                            $('#chkFrrImpo').prop('checked', true);
                        }
                        if (sub_grupo = 'In-bonds') {
                            $('#chkIBImpo').prop('checked', true);
                        }
                        if (sub_grupo = '1') {
                            ImportMP = 1;
                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPQuimicosImpo').prop('checked', true);
                        }
                        if (sub_grupo = '2') {
                            ImportMP = 1;

                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPCarbonImpo').prop('checked', true);
                        }
                        if (sub_grupo = '3') {
                            ImportMP = 1;
                            $('#chkMPImpo').prop('checked', true);
                            $('#chkMPQuimicosImpo').prop('checked', true);
                            $('#chkMPCarbonImpo').prop('checked', true);

                        }
                        break;
                    case 'Renta de equipo':
                        RE = 1;
                        $('#chkRE').prop('checked', true);

                        if (sub_grupo == '4') {
                            $('#chkRntaCajas').prop('checked', true);
                        }
                        if (sub_grupo == '5') {
                            $('#chkRentaSD').prop('checked', true);

                        }
                        if (sub_grupo == '6') {
                            $('#chkRntaCajas').prop('checked', true);
                            $('#chkRentaSD').prop('checked', true);

                        }
                        break;
                    case 'Transportacion':
                        transport = 1;
                        $('#chkTransportacion').prop('checked', true);

                        if (sub_grupo == 'Carga seca') {
                            $('#chkTransportCS').prop('checked', true);
                        }
                        if (sub_grupo == 'In-bonds') {
                            $('#chkIBTransport').prop('checked', true);
                        }
                        if (sub_grupo == '1') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPQuimicosTransport').prop('checked', true);
                        }
                        if (sub_grupo == '2') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPCarbonTransport').prop('checked', true);
                        }
                        if (sub_grupo == '3') {
                            ImportMP = 1;
                            $('#chkMPTransport').prop('checked', true);
                            $('#chkMPQuimicosTransport').prop('checked', true);
                            $('#chkMPCarbonTransport').prop('checked', true);
                        }
                        break;
                    case 'Agencia aduanal mexicana':
                        $('#chkLogistica').prop('checked', true);
                        break;
                    case 'Logistica':
                        $('#chkLogistica').prop('checked', true);
                        break;
                    case 'otro':
                        $('#chkOtro').prop('checked', true);
                        $('#txtOtro').val(sub_grupo);
                        Otro = 1;
                        break;

                }

            }

            if (Almacenaje == 1) {
                $('#opcionesAlmacenaje').toggle();
            }
            if (Almacenajemp == 1) {
                $('#MPAlmacenaje').show();
            }
            if (Export == 1) {
                $('#opcionesExpo').show();
            }
            if (Exportmp == 1) {
                $('#MPExpo').show();
            }
            if (Import == 1) {
                $('#opcionesImpo').show();
            }
            if (ImportMP == 1) {
                $('#MPImpo').show();
            }
            if (RE == 1) {
                $('#opcionesRenta').show();
            }
            if (transport == 1) {
                $('#opcionesTransport').show();
            }
            if (transportMP == 1) {
                $('#MPTransport').show();
            }
            if (Otro == 1) {
                $('#textoOtro').show();
            }
        }

    });
}

function dynamic_field(number) {
    var html = '<tr>';
    html += '<th><label>' + count + '</label></th>';
    html += '<td><div class="col"><input type="text" name="Descripcion" class="form-control descripcion" value=""></div></td>';
    html += '<td><div class="col"><input type="text" name="Comentarios" class="form-control comentarios"></div></td>';

    if (number > 1) {
        html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
        $('#tbodyProductos').append(html);
    } else {
        html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
        $('#tbodyProductos').html(html);
    }
}