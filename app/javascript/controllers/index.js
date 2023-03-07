import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PopoverController from "./popover_controller"
application.register("popover", PopoverController)

import SwiperController from "./swiper_controller"
application.register("swiper", SwiperController)

import ClipboardController from './clipboard_controller'
application.register('clipboard', ClipboardController)
