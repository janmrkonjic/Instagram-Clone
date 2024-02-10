import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="apply-filter"
export default class extends Controller {
  connect() {
    console.log('PixelsJS', pixelsJS);
  }
}
