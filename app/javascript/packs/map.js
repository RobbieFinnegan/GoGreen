import mapboxgl from 'mapbox-gl'
console.log('Hello from map')

const initMap = () => {
    const mapElement = document.querySelector('#map');

    if (mapElement) {
        mapboxgl.accessToken =  mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10',
        })
    }
}

initMap()

