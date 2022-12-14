$(document).ready(function () {
    window.initMap = initMap;

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