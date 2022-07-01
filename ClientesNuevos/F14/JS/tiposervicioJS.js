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



    //Tabla de informacion de productos
    var count = 1;
    dynamic_field(count);

    function dynamic_field(number) {
        var html = '<tr>';

        html += '<td><div class="col"><input type="text" name="in_number[]" class="form-control" value=""></div></td>';
        html += '<td><div class="col"><input type="text" name="in_description[]" class="form-control"></div></td>';

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



});

