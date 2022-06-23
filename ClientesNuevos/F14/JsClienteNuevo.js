/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />


$(document).ready(function () {

    $('#btnNxt').click(function () {
        var atributo = $('#IframeComp').attr('src');
        var pg1 = 'Secciones/InformacionCompania.html';
        var pg2 = 'Secciones/InformacionFacturacion.html';

        if (atributo == pg1) {
            $('#IframeComp').attr('src', pg2);
        } else if (atributo == pg2) {
            $('#IframeComp').attr('src', pg1);
        }

    });

    $('#btnPrueba').click(function () {
        var atributo = $('#IframeComp').attr('src');
        var pg1 = 'Secciones/InformacionCompania.html';
        var pg2 = 'Secciones/InformacionFacturacion.html';
        var frame = document.getElementById('IframeComp');
        var txt;


        if (atributo == pg1) {
            
            txt = frame.contentWindow.document.getElementById('txtNombreCompania').value;
           
        } else if (atributo == pg2) {

        txt = frame.contentWindow.document.getElementById('txtDirecFacturacion').value;
       
        }
        console.log(txt);

    
    });



    

});
