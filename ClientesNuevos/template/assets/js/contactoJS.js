$(document).ready(function () {
    window.initMap = initMap;


    $('#MainContent_btnEnviar').click(function () {
        var nombre = $('#MainContent_txtNombre').val();
        var subject = $('#MainContent_txtAsunto').val();
        var body = $('#MainContent_txtCuerpo').val();
        var aux = ''
        var splitted = body.split("\n");

        for (var i = 0; i < splitted.length; i++) {
            aux += splitted[i] + '%0A';
        }
        window.location = "mailto:certificaciones@hungaros.com?cc=sistemas.aux@hungaros.com;sistemas@hungaros.com&subject="+subject+"&body="+aux+"%0A-"+nombre;
    });

});

// Initialize and add the map
function initMap() {
    // The location of Uluru
    const uluru = { lat: 31.28594883790116, lng: -110.9417948249202 };
    // The map, centered at Uluru
    const map = new google.maps.Map(document.getElementById("mapa"), {
        zoom: 17,
        center: uluru,
    });
    // The marker, positioned at Uluru
    const marker = new google.maps.Marker({
        position: uluru,
        map: map,
    });
}


