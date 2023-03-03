import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    console.log('hi doug')
    const swiper = new Swiper(".mySwiper", {
      effect: "cards",
      grabCursor: true,
      on: {
        init: function (event) {
          console.log('swiper init', event);
       },
       transitionEnd: function (event) {
           console.log('swiper change', event.swipeDirection, event.slides[event.previousIndex].id);
          //  swiper.removeSlide(event.previousIndex)
        }
      },
    });

    // swiper.on('slideChange', (event) => {
    //   if (this.flag === false ) {
    //     console.log('slide changed', event);
    //     swiper.removeSlide(event.previousIndex)
    //     this.flag = true
    //     setTimeout(() => {
    //       this.flag = false
    //     }, 2000);
    //   }
    // });
  }
}
