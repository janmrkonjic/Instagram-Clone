import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-filter"
export default class extends Controller {
  static targets = [ 'image' ];
  connect() {
    this.element.onload = () => {
      pixelsJS.filterImg(this.element, this.element.dataset.filter);
    }
  }
}
