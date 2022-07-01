/// <reference path="../scripts/js/ajax.js" />
/// <reference path="../scripts/jquery-3.6.0.min.js" />


$(document).ready(function () {
    var pg1 = 'Secciones/InformacionCompania.html';
    var pg3 = 'Secciones/InformacionCadenaSuministro.html';
    var pg2 = 'Secciones/TipoServicioProductos.html';

    $('#btnNxt').click(function () {
        var atributo = $('#IframeComp').attr('src');
        var iframe1 = $('#IframeComp');

        if (atributo == pg1) {
            iframe1.attr('src', pg2);
            resizeIframe('#IframeComp');
        } else if (atributo == pg2) {
            iframe1.attr('src', pg3);
            resizeIframe('#IframeComp');
        } else if (atributo == pg3) {
            iframe1.attr('src', pg1);
            resizeIframe('#IframeComp');
        }

    });

    

    //$('#btnPrueba').click(function () {
    //    var atributo = $('#IframeComp').attr('src');
        
    //    var frame = document.getElementById('IframeComp');
    //    var txt;
    //    if (atributo == pg1) {            
    //        txt = frame.contentWindow.document.getElementById('txtNombreCompania').value;           
    //    } else if (atributo == pg2) {
    //    txt = frame.contentWindow.document.getElementById('txtDirecFacturacion').value;       
    //    }
    //    console.log(txt);
    //});

    $(function () {
        let iframe = $('#IframeComp');

        let button = iframe.contents().find('#botonBonito');

        button.trigger("click");
    });

});


//$('#IframeComp').load(function () {
//    var iframe = $('#iframe').contents();
//    iframe.find('botonBonito').click(function () {
//        alert("Me hiciste click !");
//    });
//});
function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
}
