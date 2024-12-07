import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
// Connects to data-controller="map"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }))

    // Add zoom and rotation controls to the map
    let nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav, 'bottom-right'); // Add the zoom and rotation controls to the map

    // Disable scroll zoom by default
    map.scrollZoom.disable();

    // Gérer l'état de la touche Ctrl
    let isCtrlPressed = false;

    // Activer ou désactiver le zoom Mapbox en fonction de la touche Ctrl
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Control') {
        isCtrlPressed = true;
        map.scrollZoom.enable(); // Activer le zoom Mapbox
      }
    });

    document.addEventListener('keyup', function (e) {
      if (e.key === 'Control') {
        isCtrlPressed = false;
        map.scrollZoom.disable(); // Désactiver le zoom Mapbox
      }
    });

    // Empêcher le zoom du navigateur lorsque Ctrl est appuyé
    document.addEventListener(
      'wheel',
      function (e) {
        if (isCtrlPressed) {
          e.preventDefault(); // Empêcher le comportement par défaut du navigateur
        }
      },
      { passive: false } // Obligatoire pour que `preventDefault()` fonctionne
    );

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_ninja_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html


      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })

  }

}
