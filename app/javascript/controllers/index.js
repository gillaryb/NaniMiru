import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PopoverController from "./popover_controller"
application.register("popover", PopoverController)

import SwiperController from "./swiper_controller"
application.register("swiper", SwiperController)

import ClipboardController from './clipboard_controller'
application.register('clipboard', Clipboard)

import Clipboard from "stimulus-clipboard"

export default class extends Clipboard {
  connect() {
    super.connect()
    console.log('Do what you want here.')
    console.log(this.buttonTarget)
  }

  // Function to override on copy.
  copy() {
    console.log("I am in copy");

  }

  // Function to override when to input is copied.
  copied() {
    console.log("I am in copied");
    //
  }
}