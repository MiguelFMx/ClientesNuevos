/// <reference path="../jquery-3.6.0.min.js" />

function GetAjax(strUrl, strParametros, bolAsync, fnSuccess) {
    $.ajax({
        type: "POST",
        url: strUrl,
        data: "{" + strParametros + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: bolAsync,
        success: function (objResult) {
            if (fnSuccess !== undefined) {
                fnSuccess(objResult.d);
            }
            return false;
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (errorThrown !== "") {
                alert("Error en Post: " + errorThrown);
            }
        }
    });
    return false;
}