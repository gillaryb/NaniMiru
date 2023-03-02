import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    console.log('hi doug')
    const swiper = new Swiper('.swiper', {
      direction: 'vertical',
      loop: false,
      effect: "cards",
      grabCursor: true,
    });
  }
}
