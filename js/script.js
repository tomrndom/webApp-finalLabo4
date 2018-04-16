var marker;
var geocoder;
var map;
var latitud;
var longitud;

function initMap() {
    geocoder = new google.maps.Geocoder();

    map = new google.maps.Map(document.getElementById("googleMap"), {
        center: { lat: -32.8896555, lng: -68.8470147 },
        zoom: 14,
        clickableIcons: false,
        fullscreenControl: false,
        streetViewControl: false
    });

    // Lister función marcador
    google.maps.event.addListener(map, "click", function(event) {
        placeMarker(event.latLng);
    });
    // Marcar con un click la ubicación
    function placeMarker(location) {
        if (marker === undefined) {
            marker = new google.maps.Marker({
                position: location,
                map: map
            });
            latitud = marker.getPosition().lat();
            longitud = marker.getPosition().lng();
            
            document.getElementById('hiddenLat').value = latitud;
            document.getElementById('hiddenLng').value = longitud;
        } else {
            marker.setPosition(location);
            latitud = marker.getPosition().lat();
            longitud = marker.getPosition().lng();
            
            document.getElementById('hiddenLat').value = latitud;
            document.getElementById('hiddenLng').value = longitud;
        }                
    }
}

function codeAddress() {
    var calle = document.getElementById("ContentPlaceHolder1_txtCalle").value;
    var numero = document.getElementById("ContentPlaceHolder1_txtNro").value;
    var localidad = document.getElementById("ContentPlaceHolder1_txtLocalidad").value;
    var direccion = calle + " " + numero + ", " + localidad;

    console.log(calle);
    console.log(numero);
    console.log(localidad);

    geocoder.geocode({ address: direccion }, function(results, status) {        
        if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            if (marker === undefined) {
                marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location

                });
                latitud = marker.getPosition().lat();
                longitud = marker.getPosition().lng();
                
                document.getElementById('hiddenLat').value = latitud;
                document.getElementById('hiddenLng').value = longitud;
            } else {
                marker.setPosition(results[0].geometry.location)
                latitud = marker.getPosition().lat();
                longitud = marker.getPosition().lng();
                
                document.getElementById('hiddenLat').value = latitud;
                document.getElementById('hiddenLng').value = longitud;
            }
            map.setZoom(16);
        } else {
            alert("Error al ubicar la dirección ingresada en el mapa: " + status);
        }
    });    
}