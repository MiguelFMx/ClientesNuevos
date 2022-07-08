﻿/// <reference path="../scripts/jquery-3.6.0.min.js" />
/// <reference path="../scripts/js/ajax.js" />

$(document).ready(function(){
    //Tabla de informacion de productos
    var count = 1;
    dynamic_field(count);

   

    $('#add').click(function () {
        count++;
        dynamic_field(count);
    });

    $(document).on('click', '#remove', function () {
        count--;
        $(this).parent().closest("tr").remove();
    });
});

function dynamic_field(number) {
        var html = '<tr>';

        html += '<td><div class="col"><input type="text" name="in_cliente[]" class="form-control" value=""></div></td>';
        html += '<td><div class="col"><input type="text" name="in_proceso[]" class="form-control"></div></td>';
        html += '<td><div class="col"><input type="text" name="in_movimiento[]" class="form-control"></div></td>';
        html += '<td><div class="col"><input type="text" name="in_detalles[]" class="form-control"></div></td>';
        html += '<td><div class="col"><input type="text" name="in_dias[]" class="form-control"></div></td>';
        html += '<td><div class="col"><input type="text" name="in_modo[]" class="form-control"></div></td>';
        html += '<td><div class="col"><input type="text" name="in_pregunta[]" class="form-control"></div></td>';

        if (number > 1) {
            html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
            $('#tMapeo tbody').append(html);
        } else {
            html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
            $('#tMapeo tbody').html(html);
        }
    }