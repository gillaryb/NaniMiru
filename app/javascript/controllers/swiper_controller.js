import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    console.log('lol hi')
  }
}
