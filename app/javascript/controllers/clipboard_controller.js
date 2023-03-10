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
