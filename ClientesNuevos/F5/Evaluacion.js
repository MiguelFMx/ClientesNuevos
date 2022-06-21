/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />

var current = 1;
$(document).ready(function () {

    setProgressBar(current);

    cargarTablaStepS(current);


    $("#btnSiguiente").click(function () {

        if (current <8) {
            current++;
            setProgressBar(current);
            cargarTablaStepS(current);
        }
    });

    $("#btnAntrior").click(function () {
        if (current >= 2) {
            current--;
            setProgressBar(current);
            cargarTablaStepS(current);
        }
    });

});





function cargarTabla() {
    

    GetAjax("../wsAutoevaluacion.asmx/LlenarTabla", "", false, function (lstPreguntas){
        var objPrgunta;
        var objBodyPreguntas = $("#tPreguntas tbody");
        objBodyPreguntas.empty();
        for (var i = 0; i < lstPreguntas.length; i++) {
            objPrgunta = lstPreguntas[i];
            objBodyPreguntas.append(
                "<tr>" +
                "<th scop='col' ><span>" + objPrgunta.numero + "</span></th>" +
                "<td><span> " + objPrgunta.pregunta + "</span></td>" + //<th scope="row">1</th>
                "<td><input type='radio' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5'  /></td>" +
                "<td><input type='radio'  id='parcial" + objPrgunta.numero + "'name='pregunta" + objPrgunta.numero + "' value='3'  /></td>" +
                "<td><input type='radio'  id='no" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='0'  /></td>" +
                "<td><input type='radio'  id='na" + objPrgunta.numero + "'  name='pregunta" + objPrgunta.numero + "' value='0'  /></td>" +
                "<td><input type='text' id='txtObservacion" + objPrgunta.numero + "' /></td>" +
                "</tr>"
            );
        }
        return false;
    });
        setProgressBar(current);
    return false;
}


// actualizar barra
function setProgressBar(curStep) {
    var percent = parseFloat(100 / 8) * curStep;
    percent = percent.toFixed();
    $("#barradeprogreso")
        .css("width", percent + "%")
        .html(percent + "%");

    $("caption").html(current + " de 8");
}


//Funcion que carga las preguntas de la tabla, de bloque en bloque 
function cargarTablaStepS(currentStep) {

    GetAjax("../wsAutoevaluacion.asmx/LlenarTablaS", "'currentStep':'" + currentStep+"'" , false, function (lstPreguntas) {
        var objPrgunta;
        var objBodyPreguntas = $("#tPreguntas tbody");
        objBodyPreguntas.empty();
        for (var i = 0; i < lstPreguntas.length; i++) {
            objPrgunta = lstPreguntas[i];
            objBodyPreguntas.append(
                "<tr>" +
                "<th scop='row' class='table-dark'><span>" + objPrgunta.numero + "</span></th>" +
                "<td><span> " + objPrgunta.pregunta + "</span></td>" + //<th scope="row">1</th>
                "<td><input type='radio' class='form-check-input' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5'  /></td>" +
                "<td style='text-align:center;' ><input type='radio' class='form-check-input' id='parcial" + objPrgunta.numero + "'name='pregunta" + objPrgunta.numero + "' value='3'  /></td>" +
                "<td><input type='radio' class='form-check-input' id='no" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='0'  /></td>" +
                "<td><input type='radio' class='form-check-input' id='na" + objPrgunta.numero + "'  name='pregunta" + objPrgunta.numero + "' value='0'  /></td>" +
                "<td colspan='4'><input type='text'  class='form-control form-control-lg' id='txtObservacion" + objPrgunta.numero + "' /></td>" +
                "</tr>"
            );
        }
        return false;
    });
    setProgressBar(current);
    return false;
}

