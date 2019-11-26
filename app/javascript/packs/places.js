import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('green-space-address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

initAutocomplete()

