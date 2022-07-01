/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />

var current = 1;
$(document).ready(function () {

    setProgressBar(current);

    cargarTablaStepS(current);


    $("#btnSiguiente").click(function () {

        if (current < 8) {
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


    $("#btnCheck").click(function () {
        var pregunta = [];
        var respuesta = [];

        var numero, radio, texto;
        $('tr').each(function () {

                numero = $(this).find('.numero').text();
                radio = $(this).find('.respuesta:checked').val();
                texto = $(this).find('.observacion').val();
            if (numero != "") {
                respuesta = [numero, radio, texto];
                pregunta.push(respuesta);
            }

           
        });
        console.log(pregunta);
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

            //colocacion de titulos
            objBodyPreguntas.append(Titulos(objPrgunta.numero));

            objBodyPreguntas.append(
                "<tr>" +
                //Numero de prgunta
                "<td style='background-color:#015DAC; color:white;' class='numero'><span>" + objPrgunta.numero + "</span></td>" +
                //Descripcion de pregunta
                "<td><span> " + objPrgunta.pregunta + "</span></td>" + 
                //Opciones
                //si
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='si" + objPrgunta.numero + "'>Si</label>" +
                "<input type='radio' class='form-check-input respuesta' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5'  />" +
                "</div>" +
                "</td>" +
                //parcial
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='parcial" + objPrgunta.numero + "'>Parcial</label>" +
                "<input type='radio' class='form-check-input respuesta' id='parcial" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='3'  />" +
                "</div>" +
                "</td>" +
                //NO
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='no" + objPrgunta.numero + "'>No</label>" +
                "<input type='radio' class='form-check-input respuesta' id='no" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='1'  />" +
                "</div>" +                
                "</td>" +
                //N/A
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='na" + objPrgunta.numero + "'>N/A</label>" +
                "<input type='radio' class='form-check-input respuesta' id='na" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='0'  />" +
                "</div>" +
                "</td>" +
               
                //texto
                "<td >" +
                "<input type='text'  class='form-control form-control-lg observacion' id='txtObservacion" + objPrgunta.numero + "' required/>" +
                "</td>" +
                "</tr>"
            );
        }
        return false;
    });
    setProgressBar(current);
    document.documentElement.scrollTop = 0;
    

    return false;
}

//Funcion que agregas los titulos de cada bloque
function Titulos(numeroPregunta) {
    var tittle = "<tr style='background-color:#015DAC; color:white;'>";
    switch (numeroPregunta){
        case '1.0.1':
            tittle+=
                "<th> <span>1.0.0</span> </th>" +
                "<th colspan='6'> <span>Requerimientos de los socios comerciales </span>  </th>" +
                "</tr>"
            ;
            break;
        case '1.1.1':
            tittle+=
                "<th> <span>1.1.0</span> </th>" +
                "<th colspan='6'> <span>Procedimientos de seguridad </span>  </th>" +
                "</tr>"
            ;
            break;
        case '1.2.1':
            tittle+=
                "<th> <span>1.2.0</span> </th>" +
                "<th colspan='6'> <span>Punto de origen </span>  </th>" +
                "</tr>"
            ;
            break;
        case '1.3.1':
            tittle+=
                "<th> <span>1.3.0</span> </th>" +
                "<th colspan='6'> <span>Participación / Certificación en programas de seguridad de la cadena de abastecimiento de administraciones aduanales extranjeras</span>  </th>" +
                "</tr>"
            ;
            break;
        case '1.4.1':
            tittle+=
                "<th> <span>1.4.0</span> </th>" +
                "<th colspan='6'> <span>Procedimientos de Seguridad</span>  </th>" +
                "</tr>"
            ;
            break;
        case '2.0.1':
            tittle +=
                "<th> <span>2.0.0</span> </th>" +
                "<th colspan='6'> <span>Seguridad de Contenedores y Remolques</span>  </th>" +
                "</tr>"
                ;
            break;
        case '2.2.1':
            tittle +=
                "<th> <span>2.2.0</span> </th>" +
                "<th colspan='6'> <span>Inspección de los contenedores</span>  </th>" +
                "</tr>"
                ;
            break;
        case '2.3.1':
            tittle +=
                "<th> <span>2.3.0</span> </th>" +
                "<th colspan='6'> <span>Inspección del Remolque</span>  </th>" +
                "</tr>"
                ;
            break;
        case '2.4.1':
            tittle +=
                "<th> <span>2.4.0</span> </th>" +
                "<th colspan='6'> <span>Sellos de los remolques y contenedores</span>  </th>" +
                "</tr>"
                ;
            break;
        case '2.5.1':
            tittle +=
                "<th> <span>2.5.0</span> </th>" +
                "<th colspan='6'> <span>Almacenamiento de contenedores y remolques</span>  </th>" +
                "</tr>"
                ;
            break;
        case '3.0.1':
            tittle +=
                "<th> <span>3.0.0</span> </th>" +
                "<th colspan='6'> <span> Controles de acceso físico </span>  </th>" +
                "</tr>"
                ;
            break;
        case '3.1.1':
            tittle +=
                "<th> <span>3.1.0</span> </th>" +
                "<th colspan='6'> <span> Control de Empleados </span>  </th>" +
                "</tr>"
                ;
            break;
        case '3.2.1':
            tittle +=
                "<th> <span>3.2.0</span> </th>" +
                "<th colspan='6'> <span> Control de visitantes </span>  </th>" +
                "</tr>"
                ;
            break;
        case '3.3.1':
            tittle +=
                "<th> <span>3.3.0</span> </th>"+
                "<th colspan='6'> <span> Control de Entregas (incluyendo la correspondencia) </span>  </th>" +
                "</tr>"
                ;
            break;
        case '3.4.1':
            tittle +=
                "<th> <span>3.4.0</span> </th>" +
                "<th colspan='6'> <span> Abordaje y remoción de personas no autorizadas </span>  </th>" +
                "</tr>"
                ;
            break;
        case '4.0.1':
            tittle +=
                "<th> <span>4.0.0</span> </th>" +
                "<th colspan='6'> <span> Seguridad del personal </span>  </th>" +
                "</tr>"
                ;
            break;
        case '4.1.1':
            tittle +=
                "<th> <span>4.1.0</span> </th>" +
                "<th colspan='6'> <span> Verificación previa a la contratación </span>  </th>" +
                "</tr>"
                ;
            break;
        case '4.2.1':
            tittle +=
                "<th> <span>4.2.0</span> </th>" +
                "<th colspan='6'> <span> Verificación / investigación de antecedentes </span>  </th>" +
                "</tr>"
                ;
            break;
        case '4.3.1':
            tittle +=
                "<th> <span>4.3.0</span> </th>" +
                "<th colspan='6'> <span> Procedimientos de terminación de relaciones laborales </span>  </th>" +
                "</tr>"
                ;
            break;
        case '5.0.1':
            tittle +=
                "<th> <span>5.0.0</span> </th>" +
                "<th colspan='6'> <span> Seguridad de los Procesos </span>  </th>" +
                "</tr>"
                ;
            break;
        case '5.1.1':
            tittle +=
                "<th> <span>5.1.0</span> </th>" +
                "<th colspan='6'> <span> Procesamiento de la documentación </span>  </th>" +
                "</tr>"
                ;
            break;
        case '5.2.1':
            tittle +=
                "<th> <span>5.2.0</span> </th>" +
                "<th colspan='6'> <span> Procedimientos de declaración </span>  </th>" +
                "</tr>"
                ;
            break;
        case '5.3.1':
            tittle +=
                "<th> <span>5.3.0</span> </th>" +
                "<th colspan='6'> <span> Embarque y recepción </span>  </th>" +
                "</tr>"
                ;
            break;
        case '5.4.1':
            tittle +=
                "<th> <span>5.4.0</span> </th>" +
                "<th colspan='6'> <span> Discrepancias de la carga </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.0.1':
            tittle +=
                "<th> <span>6.0.0</span> </th>" +
                "<th colspan='6'> <span> Seguridad Física </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.1.1':
            tittle +=
                "<th> <span>6.1.0</span> </th>" +
                "<th colspan='6'> <span> Cercado </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.2.1':
            tittle +=
                "<th> <span>6.2.0</span> </th>" +
                "<th colspan='6'> <span> Puertas y casetas de vigilancia </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.3.1':
            tittle +=
                "<th> <span>6.3.0</span> </th>" +
                "<th colspan='6'> <span> Estacionamiento </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.4.1':
            tittle +=
                "<th> <span>6.4.0</span> </th>" +
                "<th colspan='6'> <span> Estructura del edificio </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.5.1':
            tittle +=
                "<th> <span>6.5.0</span> </th>" +
                "<th colspan='6'> <span> Dispositivos de cierre y control de llaves </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.6.1':
            tittle +=
                "<th> <span>6.6.0</span> </th>" +
                "<th colspan='6'> <span> Iluminación </span>  </th>" +
                "</tr>"
                ;
            break;
        case '6.7.1':
            tittle +=
                "<th> <span>6.7.0</span> </th>" +
                "<th colspan='6'> <span> Sistemas de alarma y cámaras de vigilancia por video. </span>  </th>" +
                "</tr>"
                ;
            break;
        case '7.0.1':
            tittle +=
                "<th> <span>7.0.0</span> </th>" +
                "<th colspan='6'> <span> Seguridad de Tecnologías de la Información </span>  </th>" +
                "</tr>"
                ;
            break;
        case '7.1.1':
            tittle +=
                "<th> <span>7.1.0</span> </th>" +
                "<th colspan='6'> <span> Protección de contraseñas </span>  </th>" +
                "</tr>"
                ;
            break;
        case '7.2.1':
            tittle +=
                "<th> <span>7.2.0</span> </th>" +
                "<th colspan='6'> <span> Responsabilidad </span>  </th>" +
                "</tr>"
                ;
            break;
        case '8.0.1':
            tittle +=
                "<th> <span>8.0.0</span> </th>" +
                "<th colspan='6'> <span>Capacitación sobre seguridad y concientización de amenazas </span>  </th>" +
                "</tr>"
                ;
            break;
    }
    return tittle;
}

function save(steps) {



}


function sacaInfo() {


}
