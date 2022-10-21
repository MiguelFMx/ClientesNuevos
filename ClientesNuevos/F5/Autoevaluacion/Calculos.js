
$(document).ready(function () {

    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

});

function CargarRes() {
    var id;
    GetAjax("../../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id = res + "F5E";
        });

    GetAjax("../wsAutoevaluacion.asmx/LlenarTablaRespuesta", "id:'"+id+"'", false, function (lstPreguntas) {
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
                "<div class='col-auto' >" +
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

function Obtener_Resdultados() {
    //Tabla 1
    var lbl100 = 0;
    var NR1 = 0;
    var lbl110 = 0;
    var aux1 = 0;
    var lbl120 = 0;
    var aux2 = 0;
    var lbl130 = 0;
    var aux3 = 0
    var lbl140 = 0;
    var aux4 = 0;
    //tabla 2
    var lbl200 = 0;
    var lbl210 = 0;
    var aux21 = 0;
    var lbl220 = 0;
    var aux22 = 0;
    var lbl230 = 0;
    var aux23 = 0;
    var lbl240 = 0;
    var aux24 = 0;
    var NR2 = 0;
    //tabla 3
    var lbl300 = 0;
    var NR3 = 0;
    var lbl310 = 0;
    var aux31 = 0;
    var lbl320 = 0;
    var aux32 = 0;
    var lbl330 = 0;
    var aux33 = 0;
    var lbl340 = 0;
    var aux34 = 0;
    //tabla 4
    var lbl400 = 0;
    var NR4 = 0;
    var lbl410 = 0;
    var aux41 = 0;
    var lbl420 = 0;
    var aux42 = 0;
    var lbl430 = 0;
    var aux43 = 0;
    //tabla 5
    var lbl500 = 0;
    var NR5 = 0;
    var lbl510 = 0;
    var aux51 = 0;
    var lbl520 = 0;
    var aux52 = 0;
    var lbl530 = 0;
    var aux53 = 0;
    var lbl540 = 0;
    var aux54 = 0;
    //tabla 6
    var lbl600 = 0;
    var NR6 = 0;
    var lbl610 = 0;
    var aux61 = 0;
    var lbl620 = 0;
    var aux62 = 0;
    var lbl630 = 0;
    var aux63 = 0;
    var lbl640 = 0;
    var aux64 = 0;
    var lbl650 = 0;
    var aux65 = 0;
    var lbl660 = 0;
    var aux66 = 0;
    var lbl670 = 0;
    var aux67 = 0;
    //tabla7
    var lbl700 = 0;
    var NR7 = 0;
    var lbl710 = 0;
    var aux71 = 0;
    var lbl720 = 0;
    var aux72 = 0;
    //tabla8
    var lbl800 = 0;
    var aux81 = 0;
    var NR8 = 0;

    //Extras
    var promedio = 0;
    var promNR = 0;
    //= $('MainContent_lbl140');

    var id;
    GetAjax("../../../F14/wsBaseDatos.asmx/GetID",
        "",
        false,
        function (res) {
            id = res + "F5E";
        });

    GetAjax("../wsAutoevaluacion.asmx/LlenarTablaRespuesta", "id:'" + id + "'", false, function (lstPreguntas) {
        var objPrgunta, strnumero;
        for (var i = 0; i < lstPreguntas.length; i++) { //en teoria ambos arreglo son iguales
            objPrgunta = lstPreguntas[i];
            strnumero = objPrgunta.numero;
            //========================Tabla 1 ============================================
            if (strnumero.substring(0, 1) == '1') {
                if (strnumero.substring(0, 3) == '1.0' || strnumero.substring == '1.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl110 = lbl110 + parseInt(objPrgunta.respuesta);
                    }                   
                    aux1++;
                }
                if (strnumero.substring(0,3) == '1.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl120 = lbl120 + parseInt(objPrgunta.respuesta);
                    }
                    aux2++;
                }
                if (strnumero.substring(0,3) == '1.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl130 = lbl130 + parseInt(objPrgunta.respuesta);
                    }
                    aux3++;
                }
                if (strnumero.substring(0,3) == '1.4') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl140 = lbl140 + parseInt(objPrgunta.respuesta);
                    } 
                    aux4++;
                }
            }
            //========================Tabla 2 ============================================
            if (strnumero.substring(0, 1) == '2') {
                if (strnumero.substring(0, 3) == '2.0' || strnumero.substring(0,3) == '2.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl210 = lbl210 + parseInt(objPrgunta.respuesta);
                    } 
                    aux21++;
                }
                if (strnumero.substring(0,3) == '2.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl220 = lbl220 + parseInt(objPrgunta.respuesta);
                    } 
                    aux22++;
                }
                if (strnumero.substring(0,3) == '2.4') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl230 = lbl230 + parseInt(objPrgunta.respuesta);
                    } 
                    aux23++;
                }
                if (strnumero.substring(0,3) == '2.5') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl240 = lbl240 + parseInt(objPrgunta.respuesta);
                    } 
                    aux24++;
                }

            }
            //========================Tabla 3=============================================
            if (strnumero.substring(0, 1) == '3') {
                if (strnumero.substring(0, 3) == '3.0' || strnumero.substring(0,3) == '3.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl310 = lbl310 + parseInt(objPrgunta.respuesta);
                    }
                    aux31++;
                }
                if (strnumero.substring(0,3) == '3.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl320 = lbl320 + parseInt(objPrgunta.respuesta);
                    }
                    aux32++;
                }
                if (strnumero.substring(0,3) == '3.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl330 = lbl330 + parseInt(objPrgunta.respuesta);
                    }
                    aux33++;
                }
                if (strnumero.substring(0,3) == '3.4') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl340 = lbl340 + parseInt(objPrgunta.respuesta);
                    }
                    aux34++;
                }
            }
            //========================Tabla 4=============================================
            if (strnumero.substring(0, 1) == '4') {
                if (strnumero.substring(0, 3) == '4.0' || strnumero.substring(0, 3) == '4.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl410 = lbl410 + parseInt(objPrgunta.respuesta);
                    }
                    aux41++;
                }
                if (strnumero.substring(0, 3) == '4.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl420 = lbl420 + parseInt(objPrgunta.respuesta);
                    }
                    aux42++;
                }
                if (strnumero.substring(0, 3) == '4.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl430 = lbl430 + parseInt(objPrgunta.respuesta);
                    }
                    aux43++;
                }
            }
            //========================Tabla 5=============================================
            if (strnumero.substring(0, 1) == '5') {
                if (strnumero.substring(0, 3) == '5.0' || strnumero.substring(0, 3) == '5.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl510 = lbl510 + parseInt(objPrgunta.respuesta);
                    }
                    aux51++;
                }
                if (strnumero.substring(0, 3) == '5.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl520 = lbl520 + parseInt(objPrgunta.respuesta);
                    }
                    aux52++;
                }
                if (strnumero.substring(0, 3) == '5.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl530 = lbl530 + parseInt(objPrgunta.respuesta);
                    }
                    aux53++;
                }
                if (strnumero.substring(0, 3) == '5.4') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl540 = lbl540 + parseInt(objPrgunta.respuesta);
                    }
                    aux54++;
                }
            }
            //========================Tabla 6=============================================
            if (strnumero.substring(0, 1) == '6') {
                if (strnumero.substring(0, 3) == '6.0' || strnumero.substring(0, 3) == '6.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl610 = lbl610 + parseInt(objPrgunta.respuesta);
                    }
                    aux61++;
                }
                if (strnumero.substring(0, 3) == '6.2' ) {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl620 = lbl620 + parseInt(objPrgunta.respuesta);
                    }
                    aux62++;
                }
                if (strnumero.substring(0, 3) == '6.3') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl630 = lbl630 + parseInt(objPrgunta.respuesta);
                    }
                    aux63++;
                }
                if (strnumero.substring(0, 3) == '6.4') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl640 = lbl640 + parseInt(objPrgunta.respuesta);
                    }
                    aux64++;
                }
                if (strnumero.substring(0, 3) == '6.5') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl650 = lbl650 + parseInt(objPrgunta.respuesta);
                    }
                    aux65++;
                }
                if (strnumero.substring(0, 3) == '6.6' ) {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl660 = lbl660 + parseInt(objPrgunta.respuesta);
                    }
                    aux66++;
                }
                if (strnumero.substring(0, 3) == '6.7') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl670 = lbl670 + parseInt(objPrgunta.respuesta);
                    }
                    aux67++;
                }
            }
            //========================Tabla 7=============================================
            if (strnumero.substring(0, 1) == '7') {
                if (strnumero.substring(0, 3) == '7.0' || strnumero.substring(0,3) == '7.1') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl710 = lbl710 + parseInt(objPrgunta.respuesta);
                    }
                    aux71++;
                }
                if (strnumero.substring(0, 3) == '7.2') {
                    if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                        lbl720 = lbl720 + parseInt(objPrgunta.respuesta);
                    }
                    aux72++;
                }
            }
            //========================Tabla 8=============================================
            if (strnumero.substring(0, 1) == '8') {
                if (objPrgunta.respuesta == '5' || objPrgunta.respuesta == '3') {
                    lbl800 = lbl800 + parseInt(objPrgunta.respuesta);
                }
                aux81++;                
            }


        }//Fin de FOR
        //==============================================================Tabla 1
        lbl110 = ((lbl110 / aux1) / 5);
        $('#MainContent_lbl110').html(Math.round(lbl110 * 100) + '%');

        lbl120 = ((lbl120 / aux2) / 5);
        $('#MainContent_lbl120').html(Math.round(lbl120 * 100) + '%');

        lbl130 = ((lbl130 / aux3) / 5);
        $('#MainContent_lbl130').html(Math.round(lbl130 * 100) + '%');

        lbl140 = ((lbl140 / aux4) / 5);
        $('#MainContent_lbl140').html(Math.round(lbl140*100)+'%');


        lbl100 = ((lbl110 + lbl120 + lbl130 + lbl140) / 4);
        $('#MainContent_lbl100').html(Math.round(lbl100*100)+'%');

        if (lbl100 <= 1 && lbl100 > 0.74) {
            NR1 = 1;
            $('#tNR1').css('background-color','#39c922');

        } else if (lbl100 > 0.49 && lbl100 < 0.75) {
            NR1 = 2;
            $('#tNR1').css('background-color', '#eddb11');
        } else if (lbl100 < 0.5) {
            NR1 = 3;
            $('#tNR1').css('background-color', '#ff0000');

        }
        $('#MainContent_NR1').html(NR1);
        //==============================================================Tabla 2
        lbl210 = ((lbl210 / aux21) / 5);
        $('#MainContent_lbl210').html(Math.round(lbl210 * 100) + '%');

        lbl220 = ((lbl220 / aux22) / 5);
        $('#MainContent_lbl220').html(Math.round(lbl220 * 100) + '%');

        lbl230 = ((lbl230 / aux23) / 5);
        $('#MainContent_lbl230').html(Math.round(lbl230 * 100) + '%');

        lbl240 = ((lbl240 / aux24) / 5);
        $('#MainContent_lbl240').html(Math.round(lbl240 * 100) + '%');

        lbl200 = ((lbl210 + lbl220 + lbl230 + lbl240) / 4);
        $('#MainContent_lbl200').html(Math.round(lbl200 * 100) + '%');

        if (lbl200 <= 1 && lbl200 > 0.74) {
            NR2 = 1;
            $('#tNR2').css('background-color', '#39c922');

        } else if (lbl200 > 0.49 && lbl200 < 0.75) {
            NR2 = 2;
            $('#tNR2').css('background-color', '#eddb11');

        } else if (lbl200 < 0.5) {
            NR2 = 3;
            $('#tNR2').css('background-color', '#ff0000');

        }
        $('#MainContent_NR2').html(NR2);
        //=============================================================Tabla 3
        lbl310 = ((lbl310 / aux31) / 5);
        $('#MainContent_lbl310').html(Math.round(lbl310 * 100) + '%');

        lbl320 = ((lbl320 / aux32) / 5);
        $('#MainContent_lbl320').html(Math.round(lbl320 * 100) + '%');

        lbl330 = ((lbl330 / aux33) / 5);
        $('#MainContent_lbl330').html(Math.round(lbl330 * 100) + '%');

        lbl340 = ((lbl340 / aux34) / 5);
        $('#MainContent_lbl340').html(Math.round(lbl340 * 100) + '%');

        lbl300 = ((lbl310 + lbl320 + lbl330 + lbl340)/4);
        $('#MainContent_lbl300').html(Math.round(lbl300 * 100) + '%');

        if (lbl300 <= 1 && lbl300 > 0.74) {
            NR3 = 1;
            $('#tNR3').css('background-color', '#39c922');

        } else if (lbl300 > 0.49 && lbl300 < 0.75) {
            NR3 = 2;
            $('#tNR3').css('background-color', '#eddb11');

        } else if (lbl300 < 0.5) {
            NR3 = 3;
            $('#tNR3').css('background-color', '#ff0000');

        }
        $('#MainContent_NR3').html(NR3);

        //=============================================================Tabla 4
        lbl410 = ((lbl410 / aux41) / 5);
        $('#MainContent_lbl410').html(Math.round(lbl410 * 100) + '%');

        lbl420 = ((lbl420 / aux42) / 5);
        $('#MainContent_lbl420').html(Math.round(lbl420 * 100) + '%');

        lbl430 = ((lbl430 / aux43) / 5);
        $('#MainContent_lbl430').html(Math.round(lbl430 * 100) + '%');

        lbl400 = ((lbl410 + lbl420 + lbl430) / 3);
        $('#MainContent_lbl400').html(Math.round(lbl400 * 100)+'%');

        if (lbl400 <= 1 && lbl400 > 0.74) {
            NR4 = 1;
            $('#tNR4').css('background-color', '#39c922');

        } else if (lbl400 > 0.49 && lbl400 < 0.75) {
            NR4 = 2;
            $('#tNR4').css('background-color', '#eddb11');

        } else if (lbl400 < 0.5) {
            NR4 = 3;
            $('#tNR4').css('background-color', '#ff0000');

        }
        $('#MainContent_NR4').html(NR4);

        //=============================================================Tabla 5
        lbl510 = ((lbl510 / aux51) / 5);
        $('#MainContent_lbl510').html(Math.round(lbl510 * 100) + '%');
        lbl520 = ((lbl520 / aux52) / 5);
        $('#MainContent_lbl520').html(Math.round(lbl520 * 100) + '%');
        lbl530 = ((lbl530 / aux53) / 5);
        $('#MainContent_lbl530').html(Math.round(lbl530 * 100) + '%');
        lbl540 = ((lbl540 / aux54) / 5);
        $('#MainContent_lbl540').html(Math.round(lbl540 * 100) + '%');

        lbl500 = ((lbl510 + lbl520 + lbl530 + lbl540) / 4);
        $('#MainContent_lbl500').html(Math.round(lbl500 * 100) + '%');
        if (lbl500 <= 1 && lbl500 > 0.74) {
            NR5 = 1;
            $('#tNR5').css('background-color', '#39c922');

        } else if (lbl500 > 0.49 && lbl500 < 0.75) {
            NR5 = 2;
            $('#tNR5').css('background-color', '#eddb11');

        } else if (lbl500 < 0.5) {
            $('#tNR5').css('background-color', '#ff0000');

            NR5 = 3;
        }
        $('#MainContent_NR5').html(NR5);
        //=============================================================Tabla 6
        lbl610 = ((lbl610 / aux61) / 5);
        $('#MainContent_lbl610').html(Math.round(lbl610 * 100) + '%');

        lbl620 = ((lbl620 / aux62) / 5);
        $('#MainContent_lbl620').html(Math.round(lbl620 * 100) + '%');

        lbl630 = ((lbl630 / aux63) / 5);
        $('#MainContent_lbl630').html(Math.round(lbl630 * 100) + '%');

        lbl640 = ((lbl640 / aux64) / 5);
        $('#MainContent_lbl640').html(Math.round(lbl640 * 100) + '%');

        lbl650 = ((lbl650 / aux65) / 5);
        $('#MainContent_lbl650').html(Math.round(lbl650 * 100) + '%');

        lbl660 = ((lbl660 / aux66) / 5);
        $('#MainContent_lbl660').html(Math.round(lbl660 * 100) + '%');

        lbl670 = ((lbl670 / aux67) / 5);
        $('#MainContent_lbl670').html(Math.round(lbl670 * 100) + '%');

        lbl600 = ((lbl610 + lbl620 + lbl630 + lbl640 + lbl650 + lbl660 + lbl670) / 7);
        $('#MainContent_lbl600').html(Math.round(lbl600 * 100) + '%');
        if (lbl600 <= 1 && lbl600 > 0.74) {
            NR6 = 1;
            $('#tNR6').css('background-color', '#39c922');

        } else if (lbl600 > 0.49 && lbl600 < 0.75) {
            NR6 = 2;
            $('#tNR6').css('background-color', '#eddb11');

        } else if (lbl600 < 0.5) {
            NR6 = 3;
            $('#tNR6').css('background-color', '#ff0000');

        }
        $('#MainContent_NR6').html(NR6);
        //=============================================================Tabla 7
        lbl710 = ((lbl710 / aux71) / 5);
        $('#MainContent_lbl710').html(Math.round(lbl710 * 100) + '%');
        lbl720 = ((lbl720 / aux72) / 5);
        $('#MainContent_lbl720').html(Math.round(lbl720 * 100) + '%');

        lbl700 = ((lbl710 + lbl720) / 2);
        $('#MainContent_lbl700').html(Math.round(lbl700 * 100) + '%');
        if (lbl700 <= 1 && lbl700 > 0.74) {
            NR7 = 1;
            $('#tNR7').css('background-color', '#39c922');

        } else if (lbl700 > 0.49 && lbl700 < 0.75) {
            NR7 = 2;
            $('#tNR7').css('background-color', '#eddb11');

        } else if (lbl700 < 0.5) {
            NR7 = 3;
            $('#tNR7').css('background-color', '#ff0000');

        }
        $('#MainContent_NR7').html(NR7);

        //=============================================================Tabla 8
        lbl800 = ((lbl800 / aux81) / 5);
        $('#MainContent_lbl800').html(Math.round(lbl800 * 100) + '%');
        if (lbl800 <= 1 && lbl800 > 0.74) {
            NR8 = 1;
            $('#tNR8').css('background-color', '#39c922');

        } else if (lbl800 > 0.49 && lbl800 < 0.75) {
            NR8 = 2;
            $('#tNR8').css('background-color', '#eddb11');

        } else if (lbl800 < 0.5) {
            NR8 = 3;
            $('#tNR8').css('background-color', '#ff0000');

        }
        $('#MainContent_NR8').html(NR8);

        promedio = ((lbl100 + lbl200 + lbl300 + lbl400 + lbl500 + lbl600 + lbl700 + lbl800) / 8);
        $('#MainContent_lblPromedio').html(Math.round(promedio * 100) + '%');

        promNR = ((NR1 + NR2 + NR3 + NR4 + NR5 + NR6 + NR7 + NR8) / 8);
        $('#MainContent_lblPromNR').html(Math.round(promNR));
        if (Math.round(promNR) == 1) {
            $('#promNR').css('background-color', '#39c922');

        } else if (Math.round(promNR) == 2) {
            $('#promNR').css('background-color', '#eddb11');

        } else if (Math.round(promNR) == 3) {
            $('#promNR').css('background-color', '#ff0000');

        }

        //Creación de grafica.
        var popCanvas = $("#Grafica");
        var barChart = new Chart(popCanvas, {
            type: 'bar',
            data: {
                labels: ["Requerimientos de socios comerciales", "Seguridad de Contenedores y Remolques", "Controles de acceso físico",
                    "Seguridad del personal", "Seguridad de los Procesos", "Seguridad Física", "Seguridad de Tecnologías de la Información",
                    "Entrenamiento de seguridad y concientización de amenazas"],
                datasets: [{
                    label:"Porcentaje de cumplimiento",
                    data: [Math.round(lbl100 * 100), Math.round(lbl200 * 100), Math.round(lbl300 * 100), Math.round(lbl400 * 100), Math.round(lbl500 * 100)
                        , Math.round(lbl600 * 100), Math.round(lbl700 * 100), Math.round(lbl800*100),100],
                    backgroundColor: [
                        'rgb(0, 122, 255)',
                        'rgb(255, 247, 0)',
                        'rgb(0, 122, 255)',
                        'rgb(255, 247, 0)',
                        'rgb(0, 122, 255)',
                        'rgb(255, 247, 0)',
                        'rgb(0, 122, 255)',
                        'rgb(255, 247, 0)'
                    ]
                }]
            },
            options: {
                indexAxis: 'y'
            },
            borderWidth: 1
        });


    });
}