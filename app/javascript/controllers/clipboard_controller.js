// import Clipboard from "stimulus-clipboard"

// export default class extends Clipboard {
//   connect() {
//     super.connect()
//     console.log('Do what you want here.')
//     console.log(this.buttonTarget)
//   }

//   // Function to override on copy.
//   copy() {
//     console.log("I am in copy");

//   }

//   // Function to override when to input is copied.
//   copied() {
//     console.log("I am in copied");
//     //
//   }
// }

// app/javascript/controllers/clipboard_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "trigger"]

  copy(event) {
    event.preventDefault()
    navigator.clipboard.writeText(this.sourceTarget.value)

    this.sourceTarget.focus()
    var triggerElement = this.triggerTarget
    var initialHTML = triggerElement.innerHTML
    triggerElement.innerHTML = "<span style='color:#F30AB2;'>Copied</span>"
    setTimeout(() => {
      triggerElement.innerHTML = initialHTML
      // unfocus
      this.sourceTarget.blur()
    }, 2000)

  }
}
