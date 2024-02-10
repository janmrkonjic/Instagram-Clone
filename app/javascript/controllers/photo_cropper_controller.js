import { Controller } from "@hotwired/stimulus"
import Cropper from 'cropperjs';


// Connects to data-controller="photo-cropper"
export default class extends Controller {
  static targets = ['image', 'form', 'xOffset', 'yOffset', 'width', 'height'];

  connect() {
    const controller = this;
    const cropper = new Cropper(this.imageTarget, {
      aspectRatio: 1 / 1,
      crop(event) {
        console.log('event.detail.x: ', event.detail.x);
        console.log( 'event.detail.y: ', event.detail.y);
        console.log('event.detail.width: ', event.detail.width);
        console.log('event.detail.height: ', event.detail.height);
        console.log('event.detail.rotate: ', event.detail.rotate);
        console.log('event.detail.scaleX: ', event.detail.scaleX);
        console.log('event.detail.scaleY: ', event.detail.scaleY);

        controller.xOffsetTarget.value = event.detail.x;
        controller.yOffsetTarget.value = event.detail.y;
        controller.widthTarget.value = event.detail.width;
        controller.heightTarget.value = event.detail.height;
      },
    });
  }
}