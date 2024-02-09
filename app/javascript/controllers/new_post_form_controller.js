import { Controller } from "@hotwired/stimulus"
import Cropper from 'cropperjs';

// Connects to data-controller="new-post-form"
export default class extends Controller {
  static targets = ['selectFileButton', 'photoFile'];

  connect () {
    console.log('Connected to new post form controller');
    console.log('Cropper', Cropper);
  }

  selectFile (e) {
    e.preventDefault();
    this.photoFileTarget.click();
  }

  submitForm () {
    this.element.submit();
  }
}
