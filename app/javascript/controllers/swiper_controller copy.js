import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="swiper"
export default class extends Controller {
  connect() {
    const swiper = new Swiper(".mySwiper", {
      effect: "cards",
      grabCursor: true,
      on: {
        init: function (event) {
          console.log('swiper init', event);
       },
      //  transitionEnd: function (event) {
      //      console.log('swiper change', event.swipeDirection, event.slides[event.previousIndex].id);
      //     //  swiper.removeSlide(event.previousIndex)
      //   },
        slideChange: function (swiper) {
          if (swiper.swipeDirection	== 'prev') swiper.slideNext(200, true)
       },
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

  accepted(event) {
    event.preventDefault()
    console.log('Hello World', event)
  }

  rejected(event){
    event.preventDefault()
  console.log("HELLO", event)
  }
}
