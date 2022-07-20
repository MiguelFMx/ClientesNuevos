$(document).ready(function () {

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

    //$('#tProgramaDeSeguridad tbody').sortable();

    $('#btnContinuar').click(function () {

        window.location.href = '../../F43/MapeoFlujo.aspx';
    });
});

function dynamic_field(number) {
    var html = '<tr>';
    //html += '<td><span>' + number + '</sapn></td>';
    html += '<td><div class="col"><input type="text" name="in_Descripcion[]" class="form-control"></div></td > ';   
    html += '<td><div class="col"><input type="text" name="in_Codigo[]" class="form-control"></div></td>';
    html += '<td>' +
            '<div class="input-group mb-3">' +
            '<input type = "file" class="form-control" name="in_Certificado[]"  accept = ".pdf" >' +
            '</div >' +
            '</td>';


    if (number > 1) {
        html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
        $('#tProgramaDeSeguridad tbody').append(html);
    } else {
        html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
        $('#tProgramaDeSeguridad tbody').html(html);
    }
}