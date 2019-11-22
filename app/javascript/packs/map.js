import mapboxgl from 'mapbox-gl'
console.log('Hello from map')

const initMap = () => {
    const mapElement = document.querySelector('#map');

    if (mapElement) {
        mapboxgl.accessToken = 'pk.eyJ1Ijoib2Rwb2xvIiwiYSI6ImNqdGg2Znd1YzBibmc0M3AyMGpsY3hpZjYifQ.U0j8X1KdXoWdUzdeONfeIQ'
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10',
        })
    }
}

initMap()

