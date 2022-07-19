$(document).ready(function () {

    

});

function CargarRes() {
    GetAjax("../wsAutoevaluacion.asmx/LlenarTablaRespuesta", "id:'1'", false, function (lstPreguntas) {
        var objPrgunta, radio;
        var objBodyPreguntas = $("#tRespuesta tbody");
        objBodyPreguntas.empty();
        for (var i = 0; i < lstPreguntas.length; i++) { //en teoria ambos arreglo son iguales
            objPrgunta = lstPreguntas[i];

            switch (objPrgunta.respuesta) {
                case '5':
                    radio =
                        "<span> ⚫Si     ⚪Parcial    ⚪No     ⚪N/A </span>";
                    break;
                case '3':
                    radio =
                        "<span> ⚪Si     ⚫Parcial    ⚪No     ⚪N/A </span>";
                    break;
                case '1':
                    radio =
                        "<span> ⚪Si     ⚪Parcial    ⚫No     ⚪N/A </span>";
                    break;
                case '0':
                    radio =
                        "<span> ⚪Si     ⚪Parcial     ⚪No    ⚫N/A </span>";
                    break;
            }
            objBodyPreguntas.append(
                "<tr>" +
                //Numero de prgunta
                //"<td ><span>" + objPrgunta.numero + "</span></td>" +
                //Descripcion de pregunta
                "<td style='font-size:12px;'>" +
                "<div class='row'>" +
                "<div class='col-auto'>" +
                "<span> " + objPrgunta.numero + "</span>" +
                "</div>" +
                "<div class='col'>" +
                "<span> " + objPrgunta.descripcion + "</span>" +
                "</div>" +
                "</div>" +
                "</td>" +
                //Respuesta
                "<td style='font-size:12px; width:200px;'>" +
                "<div>" +
                radio +
                "</div>" +
                "</td>" +
                //observacion
                "<td style='font-size:12px;'>" +
                "<div>" +
                "<span>" + objPrgunta.observacion + "</span>" +
                "</div>" +
                "</td>" +
                "</tr>"
            );
        }
        return false;
    });

    return false;
}