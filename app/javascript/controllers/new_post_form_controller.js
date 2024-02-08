import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-post-form"
export default class extends Controller {
  static targets = ['selectFileButton', 'photoFile'];

  connect() {

    this.photoFileTarget.addEventListener('change', () => {
      console.log('file attached');
      this.element.submit();
    });
  }

  selectFile(e) {
    e.preventDefault();
    this.photoFileTarget.click();
  }
}
