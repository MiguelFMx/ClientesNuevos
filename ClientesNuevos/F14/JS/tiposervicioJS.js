/// <reference path="../../scripts/js/ajax.js" />
/// <reference path="../../scripts/jquery-3.6.0.min.js" />

$(document).ready(function () {
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
    var count = 1;
    dynamic_field(count);

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

    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();
    });
    //boton------------------------------------------------------------------------------------------------------------------------------

    $('#btnTest').click(function () {
        var cookie = "";
        GetAjax("../wsBaseDatos.asmx/GetID",
            "",
            false,
            function (res) {
                cookie = res;
            });

     //---------------------Almacenaje--------------------------------------------------------------
        if ($('#chkAlmacenaje').is(':checked')) {
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
                if ($('#chkMPQuimicosAlmacenaje').is(':checked') && $('#chkMPCarbonAlmacenaje').is(':checked')==false) {
                    Almacenar('Almacenaje', '1', cookie);
                } else if ($('#chkMPCarbonAlmacenaje').is(':checked') && $('#chkMPQuimicosAlmacenaje').is(':checked') == false) {
                    Almacenar('Almacenaje', '2', cookie);
                } else if ($('#chkMPQuimicosAlmacenaje').is(':checked') && $('#chkMPCarbonAlmacenaje').is(':checked')) {
                    Almacenar('Almacenaje', '3', cookie);
                }
            }
        } 

        //---------------------Exportacion--------------------------------------------------------------
        if ($('#chkExportacion').is(':checked')) {
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
                }
                if ($('#chkMPCarbonExpo').is(':checked') && $('#chkMPQuimicosExpo').is(':checked') == false) {
                    Almacenar('Exportacion', '2', cookie);
                }
                if ($('#chkMPQuimicosExpo').is(':checked') && $('#chkMPCarbonExpo').is(':checked')) {
                    Almacenar('Exportacion', '3', cookie);
                }
            }
        }
        //-------------------Importacion-------------------------------------------------------------------
        if ($('chkImportacion')) {
            if ($('#chkImpoCS').is(':checked')) {
                Almacenar('Importacion', 'Carga seca', cookie);
            }
            if ($('#chkFrrImpo').is(':checked')) {
                Almacenar('Importacion', 'Ferrocarril', cookie);
            }
            if ($('#chkIBImpo').is(':checked')) {
                Almacenar('Importacion', 'In-bonds', cookie);
            }3
            if ($('#chkMPImpo').is(':checked')) {
                if ($('#chkMPQuimicosImpo').is(':checked') && $('#chkMPCarbonImpo').is(':checked') == false) {
                    Almacenar('Importacion', '1', cookie);
                }
                if ($('#chkMPCarbonImpo').is(':checked') && $('#chkMPQuimicosImpo').is(':checked') == false) {
                    Almacenar('Importacion', '2', cookie);
                }
                if ($('#chkMPQuimicosImpo').is(':checked') && $('#chkMPCarbonImpo').is(':checked')) {
                    Almacenar('Importacion', '3', cookie);
                }
            }
        }
        //-------------------Renta de equipo---------------------------------------------------------------
        if ($('#chkRE').is(':checked')) {
            if ($('#chkRntaCajas').is(':checked') && $('#chkRentaSD').is(':checked')==false) { //renta de cajas
                Almacenar('Renta de equipo', '4', cookie);
            }
            if ($('#chkRentaSD').is(':checked') && $('#chkRentaSD').is(':checked') == false) {//Servicio dedicado
                Almacenar('Renta de equipo', '5', cookie);
            }
            if ($('#chkRntaCajas').is(':checked') && $('#chkRentaSD').is(':checked')) { //renta de cajas y servicio dedicado
                Almacenar('Renta de equipo', '6', cookie);
            }
        }
        //-------------------Transportacion---------------------------------------------------------------
        if ($('#chkTransportacion').is(':checked')) {
            if ($('#chkTransportCS').is(':checked')) {
                Almacenar('Transportacion', 'Carga seca', cookie);
            }
            if ($('#chkIBTransport').is(':checked')) {
                Almacenar('Transportacion', 'In-bonds', cookie);
            }
            if ($('#chkMPTransport').is(':checked')) {
                if ($('#chkMPQuimicosTransport').is(':checked') && $('#chkMPCarbonTransport').is(':checked') == false) {
                    Almacenar('Transportacion', '1', cookie);
                }
                if ($('#chkMPCarbonTransport').is(':checked') && $('#chkMPQuimicosTransport').is(':checked') == false) {
                    Almacenar('Transportacion', '2', cookie);
                }
                if ($('#chkMPQuimicosTransport').is(':checked') && $('#chkMPCarbonTransport').is(':checked')) {
                    Almacenar('Transportacion', '3', cookie);
                }
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
            Almacenar('otro', servicio, cookie);
        }

    });

    $('#btnProd').click(function () {
        GuardarProducto();
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

    $('#error').html('');

    let strerror = '';

    var id_cuenta = '';
    GetAjax("../wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id_cuenta = res;
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

        //alert(arrDescripcion);
        for (var i = 0; i < arrDescripcion.length; i++) {

            GetAjax("../wsBaseDatos.asmx/Insertar_Productos", "'ID_compania':'" + id_cuenta + "','descripcion':'"++ +"','comentarios':'"++"'", false, function (res) {

            });
        }
        


    } else {
        $('#error').html('<div class="alert alert-danger">' + strerror + '</div>');
        
    }

}



