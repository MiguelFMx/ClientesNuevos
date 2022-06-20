/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />


function cargarTabla() {
    

    GetAjax("../wsAutoevaluacion.asmx/LlenarTabla", "", false, function (lstPreguntas){
        var objPrgunta;
        var objBodyPreguntas = $("#tPreguntas tbody");
        objBodyPreguntas.empty();
        for (var i = 0; i < lstPreguntas.length; i++) {
            objPrgunta = lstPreguntas[i];
            objBodyPreguntas.append(
                "<tr>" +
                "<td> <span>" + objPrgunta.numero + "</span></td>" +
                "<td><span> " + objPrgunta.pregunta + "</span></td>" +
                "<td><input type='radio' id='si" + i + "' name='pregunta" + i + "' value='5'  /></td>" +
                "<td><input type='radio'  id='parcial" + i + "'name='pregunta" + i + "' value='3'  /></td>" +
                "<td><input type='radio'  id='no" + i + "' name='pregunta" + i + "' value='0'  /></td>" +
                "<td><input type='radio'  id='na" + i + "'  name='pregunta" + i + "' value='0'  /></td>" +
                "<td><input type='text' id='txtObservacion" + i + "' /></td>" +
                "</tr>"
            );
        }
        return false;
    });
    return false;
}
