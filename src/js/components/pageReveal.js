/* eslint-disable */
import $ from 'jquery';

export default function () {
  $(document).ready(function ()
  {
    initialiseDocument();
  });

  document.addEventListener("DOMContentLoaded", function(){
    let layerClass = ".right-layer";
    let layers = document.querySelectorAll(layerClass);
    for (const layer of layers) {
      layer.classList.toggle("active");
    }

    const buttons = document.getElementsByTagName("button");

    for (const button of buttons) {
      button.addEventListener('click', () => {
        let id = button.getAttribute("id");
        console.log(id);
      });
    }
  });

  function initialiseDocument()
  {
  }
}
/* eslint-enable */
