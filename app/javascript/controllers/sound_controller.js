import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sound"
export default class extends Controller {

  connect() {
    const sound = document.querySelector('#sound');
    sound.addEventListener('click', (event) => {
      const audio = new Audio("/sound_watah.mp3");
      audio.play();
    });
  }
}
