/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />



var current = 1;

var error = [];
var pregunta = [];
var bloque1 = [],
    bloque2 = [],
    bloque3 = [],
    bloque4 = [],
    bloque5 = [],
    bloque6 = [],
    bloque7 = [],
    bloque8 = [],
    resultados = [];
var respuestas = [];

$(document).ready(function () {
    

    cargarTablaStepS(current);

    $('#btnSiguiente').click(function () {

        guardarRespuestas();

        if (error.length == 0) {
            if (current < 8) {
                current++;
                setProgressBar(current);
                switch (current) {
                    case 1:
                        if (bloque1.length != 0) {
                            cargarTablaRespuesta(current, bloque1);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 2:
                        if (bloque2.length != 0) {
                            cargarTablaRespuesta(current, bloque2);
                        } else {
                            cargarTablaStepS(current);
                        }

                        /*------------------------------------------------------------------------------------------------------------------------------------------------------*/
                        break;
                    case 3:
                        if (bloque3.length != 0) {
                            cargarTablaRespuesta(current, bloque3);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 4:
                        if (bloque4.length != 0) {
                            cargarTablaRespuesta(current, bloque4);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 5:
                        if (bloque5.length != 0) {
                            cargarTablaRespuesta(current, bloque5);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 6:
                        if (bloque6.length != 0) {
                            cargarTablaRespuesta(current, bloque6);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 7:
                        if (bloque7.length != 0) {
                            cargarTablaRespuesta(current, bloque7);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                    case 8:
                        if (bloque8.length != 0) {
                            cargarTablaRespuesta(current, bloque8);
                        } else {
                            cargarTablaStepS(current);
                        }
                        break;
                }
            } else {
                if (bloque8.length != 0) {
                    cargarTablaRespuesta(current, bloque8);
                }

                let alert = confirm('Esta seguro que desea continuar?');
                if (alert) {
                    llenarRespuesta(bloque1);
                    llenarRespuesta(bloque2);
                    llenarRespuesta(bloque3);
                    llenarRespuesta(bloque4);
                    llenarRespuesta(bloque5);
                    llenarRespuesta(bloque6);
                    llenarRespuesta(bloque7);
                    llenarRespuesta(bloque8);
                   
                    GuardarRespuestas(respuestas);

                    Actualizarstado();
                }
            }
        } else {
            error = [];
        }
    });

    $('#btnAnterior').click(function () {
        if (current >= 2) {
            current--;

            switch (current) {
                case 1:
                    if (bloque1.length != 0) {
                        cargarTablaRespuesta(current, bloque1);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 2:
                    if (bloque2.length != 0) {
                        cargarTablaRespuesta(current, bloque2);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 3:
                    if (bloque3.length != 0) {
                        cargarTablaRespuesta(current, bloque3);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 4:
                    if (bloque4.length != 0) {
                        cargarTablaRespuesta(current, bloque4);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 5:
                    if (bloque5.length != 0) {
                        cargarTablaRespuesta(current, bloque5);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 6:
                    if (bloque6.length != 0) {
                        cargarTablaRespuesta(current, bloque6);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 7:
                    if (bloque7.length != 0) {
                        cargarTablaRespuesta(current, bloque7);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
                case 8:
                    if (bloque8.length != 0) {
                        cargarTablaRespuesta(current, bloque8);
                    } else {
                        cargarTablaStepS(current);
                    }
                    break;
            }
            
        }
    });

    $('#btnMostrar2').click(function () {
        console.log(respuestas);
        console.log('------------');
        console.log(respuestas[0]);
        console.log('-----');
        console.log(respuestas[0][0]);
    });

    $("#btnCheck").click(function () {

        var respuesta = [];
        var error = []
        var numero, radio, texto;

        //Limpio arreglo tmporal para que volver a llenarlo
        vaciarTemp(current);

        //recorro cada tag tr de la  tabla
        $('tr').each(function () {
            numero = $(this).find('.numero').text();
            radio = $(this).find('.respuesta:checked').val();
            texto = $(this).find('.observacion').val();

            //si numero esta vacio significa que es titulo, si hay un numero es pregunta
            if (numero != "") {
                //reviso si se selecciono un radio
                if (radio == 5 || radio == 3 || radio == 1 || radio == 0) {

                    //Guardo los valores en un arreglo
                    respuesta = [numero, radio, texto];

                    //inserto ese arreglo en un arreglo temporal dependiendo del bloque
                    GuardarTemp(current, respuesta);
                   
                } else {
                    //si no se selecciono un radio,agrego el numero de pregunta a un arreglo de error
                    error.push(numero);                   
                }
                
               
            }           
        });

        //si el arreglo tiene objetos
        if (error.length > 0) {

            let aux = 'Falto llenar las preguntas:\n';

            //Recorro arreglo error
        for (var i = 0; i < error.length; i++) {
            aux += error[i] + '\n';
            }
            //vacio el arreglo temporal para que no se llene de nuevo
            vaciarTemp(current);

            //Muestro listado de preguntas faltantes
            alert(aux);
        }

    });

    $('#btnMostrar').click(function () {
        console.log('Bloque 1');
        console.log(bloque1);
        console.log('Bloque 2');
        console.log(bloque2);
        console.log('Bloque 3');
        console.log(bloque3);
        console.log('Bloque 4');
        console.log(bloque4);
        console.log('Bloque 5');
        console.log(bloque5);
        console.log('Bloque 6');
        console.log(bloque6);
        console.log('Bloque 7');
        console.log(bloque7);
        console.log('Bloque 8');
        console.log(bloque8);
    });


    
});


function Actualizarstado() {
    var id;
    
    GetAjax("../../../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id = res;
        });

    GetAjax("../../../F14/wsBaseDatos.asmx/InsertarDocumento", "'ID_compania':'" + id + "','Doc':'F5', 'Ruta':'null','Estatus':'revision'", false, function (res) {
        window.location.href = 'Resultados.aspx';
    });
}

// actualizar barra
function setProgressBar(curStep) {
    var percent = parseFloat(100 / 7) * curStep;
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
                "<tr id='" + objPrgunta.numero +"'>" +
                //Numero de prgunta
                "<td style='background-color:#015DAC; color:white;' class='numero'><span>" + objPrgunta.numero + "</span></td>" +
                //Descripcion de pregunta
                "<td><span> " + objPrgunta.pregunta + "</span></td>" + 
                //Opciones
                //si
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='si" + objPrgunta.numero + "'>Si</label>" +
                "<input type='radio' class='form-check-input respuesta' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5' />" +
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
                "<input type='text'  class='form-control observacion' id='txtObservacion" + objPrgunta.numero + "' value=''/>" +
                "</td>" +
                "</tr>"
            );
        }
        return false;
    });
    setProgressBar(current-1);
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

//Cargar tabla con respuestas, numro de paso(bloque) y arreglo de respuestas
function cargarTablaRespuesta(currentStep, arreglo) {

    GetAjax("../wsAutoevaluacion.asmx/LlenarTablaS", "'currentStep':'" + currentStep + "'", false, function (lstPreguntas) {
        var objPrgunta, radiosi, radioparcial, radiono, radiona;
        var objBodyPreguntas = $("#tPreguntas tbody");
        objBodyPreguntas.empty();
        for (var i = 0; i < lstPreguntas.length; i++) { //en teoria ambos arreglo son iguales
            objPrgunta = lstPreguntas[i];

            //colocacion de titulos
            objBodyPreguntas.append(Titulos(objPrgunta.numero));

            radiosi = 
                "<input type='radio' class='form-check-input respuesta' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5'  />";

            radioparcial = 
                "<input type='radio' class='form-check-input respuesta' id='parcial" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='3'  />";

            radiono =
                "<input type='radio' class='form-check-input respuesta' id='no" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='1'  />";

            radiona = 
                "<input type='radio' class='form-check-input respuesta' id='na" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='0'  />";

       
            switch (arreglo[i][1]) {
                case '5':
                    radiosi =
                        "<input type='radio' class='form-check-input respuesta' id='si" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='5' checked />";
                    break;
                case '3':
                    radioparcial =
                        "<input type='radio' class='form-check-input respuesta' id='parcial" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='3'  checked/>";
                    break;
                case '1':
                    radiono =
                        "<input type='radio' class='form-check-input respuesta' id='no" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='1'  checked/>";
                    break;
                case '0':
                    radiona =
                        "<input type='radio' class='form-check-input respuesta' id='na" + objPrgunta.numero + "' name='pregunta" + objPrgunta.numero + "' value='0'  checked/>";
                    break;
            }
            objBodyPreguntas.append(
                "<tr id='" + objPrgunta.numero+"'>" +
                //Numero de prgunta
                "<td style='background-color:#015DAC; color:white;' class='numero'><span>" + objPrgunta.numero + "</span></td>" +
                //Descripcion de pregunta
                "<td><span> " + objPrgunta.pregunta + "</span></td>" +
                //Opciones
                //si
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='si" + objPrgunta.numero + "'>Si</label>" +
                radiosi +
                "</div>" +
                "</td>" +
                //parcial
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='parcial" + objPrgunta.numero + "'>Parcial</label>" +
                radioparcial +
                "</div>" +
                "</td>" +
                //NO
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='no" + objPrgunta.numero + "'>No</label>" +
                radiono +
                "</div>" +
                "</td>" +
                //N/A
                "<td>" +
                "<div class='form-check'>" +
                "<label class='form-check-label' for='na" + objPrgunta.numero + "'>N/A</label>" +
                radiona+
                "</div>" +
                "</td>" +

                //texto
                "<td >" +
                "<input type='text'  class='form-control observacion' id='txtObservacion" + objPrgunta.numero + "' value='" + arreglo[i][2] +"' required/>" +
                "</td>" +
                "</tr>"
            );
        }
        return false;
    });
    setProgressBar(current-1);
    document.documentElement.scrollTop = 0;


    return false;
}

function guardarRespuestas() {
    var respuesta = [];
    var numero, radio, texto;

    //Limpio arreglo tmporal para que volver a llenarlo
    vaciarTemp(current);

    //recorro cada tag tr de la  tabla
    $('tr').each(function () {
        numero = $(this).find('.numero').text();
        radio = $(this).find('.respuesta:checked').val();
        texto = $(this).find('.observacion').val();

        //si numero esta vacio significa que es titulo, si hay un numero es pregunta
        if (numero != "") {
            //reviso si se selecciono un radio
            if (radio == 5 || radio == 3 || radio == 1 || radio == 0) {

                //Guardo los valores en un arreglo
                respuesta = [numero, radio, texto];

                //inserto ese arreglo en un arreglo temporal dependiendo del bloque, se guarda respuesta
                GuardarTemp(current, respuesta);

            } else {
                //si no se selecciono un radio,agrego el numero de pregunta a un arreglo de error
                error.push(numero);
            }


        }
    });

    //si el arreglo tiene objetos
    if (error.length > 0) {

        let aux = 'Falto llenar las preguntas:\n';

        //Recorro arreglo error
        for (var i = 0; i < error.length; i++) {
            aux += error[i] + '\n';

        /*Mostrar las respuestas faltantes */

            document.getElementById((error[i])).style.outline = 'red solid 1px';
            document.getElementById((error[i])).style.borderColor = 'red';
            document.getElementById((error[i])).style.boxShadow = '0 0 30px red';
        }
        //vacio el arreglo temporal para que no se llene de nuevo
        vaciarTemp(current);

        //Muestro listado de preguntas faltantes
        alert(aux);
    }
}

function GuardarTemp(step,arreglo) {
    switch (step) {
        case 1:           
            bloque1.push(arreglo);
            break;
        case 2:
            bloque2.push(arreglo);
            break;
        case 3:
            bloque3.push(arreglo);
            break;
        case 4:
            bloque4.push(arreglo);
            break;
        case 5:
            bloque5.push(arreglo);
            break;
        case 6:
            bloque6.push(arreglo);
            break;
        case 7:
            bloque7.push(arreglo);
            break;
        case 8:
            bloque8.push(arreglo);
            break;

    }
}

//Limpiar arrays temporales
function vaciarTemp(step) {
    switch (step) {
        case 1:
            bloque1 = [];
            break;
        case 2:
            bloque2 = [];
            break;
        case 3:
            bloque3 = [];
            break;
        case 4:
            bloque4 = [];
            break;
        case 5:
            bloque5 = [];
            break;
        case 6:
            bloque6 = [];
            break;
        case 7:
            bloque7 = [];
            break;
        case 8:
            bloque8 = [];
            break;

    }
}

function llenarRespuesta(array) {
    for (var i = 0; i < array.length; i++) {
        respuestas.push(array[i]);
    }
}



function GuardarRespuestas(arr) {

    var list = [];
    var id;
    GetAjax("../../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id = res+"F5E";
        });

    for (var i = 0; i < arr.length; i++) {

    $.ajax({
            type: "POST",
            url: "../wsAutoevaluacion.asmx/RegistrarRespuesta",
            contentType: "application/json; charset=utf-8",
            processData: false,
        data: "{" +
                "id_evaluacion:'"+id+"',"+
                "numero:'" + arr[i][0] +"',"+
                "respuesta: '" + arr[i][1] + "',"+
                "descripcion:'" + arr[i][2] + "'"
                + "}",
            dataType: 'json',
            async: false,
            success: function (result) {
                if (result.d === "") {
                    console.log("Actualizacion exitosa");

                } else {
                    console.log("Error: " + result.d);
                    
                }
            },
            error: function ( err) {
                console.log(" Error "+err);
            }
        });
       
  }
    
}

function valor(aux) {
    var x;
    x = parseInt((aux < 3 ? 0 : aux));

    return x;
}