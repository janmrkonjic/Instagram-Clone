// Entry point for the build script in your package.json
import "trix"
import "@rails/actiontext"
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

window.addEventListener("trix-file-accept", function(event) {
    event.preventDefault()
    alert("File attachment not supported!")
  })


