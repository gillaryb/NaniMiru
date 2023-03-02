import { Application } from "@hotwired/stimulus"

let application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
