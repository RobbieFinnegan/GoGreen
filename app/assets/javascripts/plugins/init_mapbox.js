const addMarkerToMap = (map, markers) => {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      new mapboxgl.Marker()
        .setLonLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);

    });
  };
