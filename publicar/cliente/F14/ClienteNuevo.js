/// <reference path="../../scripts/jquery-3.6.0.min.js" />
/// <reference path="../../scripts/js/ajax.js" />


/***********************************
        Mostra contacto
************************************/
function MostrarContacto() {

    GetAjax("../../wsAutoevaluacion.asmx/LlenarTablaS", "", false, function (lstContactoComp) {


    });
    return false;

}