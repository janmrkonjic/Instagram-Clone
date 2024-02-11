import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="apply-filter"
export default class extends Controller {
  static targets = ['image'];

  connect() {
    this.imageTargets.forEach((imageTarget) => {
      pixelsJS.filterImg(imageTarget, imageTarget.dataset.filter);

  });
  }
}
