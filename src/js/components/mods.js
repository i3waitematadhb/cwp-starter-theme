/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {
    HeaderSettings();

    SliderSection();
  }

  function HeaderSettings()
  {
    let preheaderBtns = $('.preheader-btns');
    let searchBtn = preheaderBtns.find('.btn-search');
    let loginBtn  = preheaderBtns.find('.btn-login');
    let searchForm = $('.preheader-search');
    let loginForm  = $('.preheader-login');
    //Search Button
    searchBtn.click(function () {
      if (searchForm.hasClass('open')) {
        searchForm.removeClass('open');
      } else {
        searchForm.addClass('open');
      }
    });
    //Login Button
    loginBtn.click(function () {
      if (loginForm.hasClass('open')) {
        loginForm.removeClass('open');
      } else {
        loginForm.addClass('open');
      }
    });
  }

  function SliderSection()
  {
    let sectionSlider = $('.sectionSlider');
    if (sectionSlider.length > 0)
    {
      let sectionSliderItem = sectionSlider.find('.owl-carousel');
      sectionSliderItem.owlCarousel({
        items:1,
        loop:true,
        autoplayTimeout:1000,
        nav: true,
        dots:false,
        navText: ['<i class="fal fa-chevron-left"></i>', '<i class="fal fa-chevron-right"></i>']
      });
    }
  }

  function callAPIEndpoint(endpoint, method, postData, callback)
  {
    let test = true;
    let httpRequest =  new XMLHttpRequest();
    httpRequest.open(method, endpoint, true);
    httpRequest.onreadystatechange = function() {
      if(httpRequest.readyState === 4) {
        if(httpRequest.status === 200) {
          if(callback) {
            callback(JSON.parse(httpRequest.response));
          }
        }
      }
    };
    if(postData) {
      if(test) {
        postData += '&test=1';
      }
      httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      httpRequest.send(postData);
    } else {
      httpRequest.send(null);
    }
  }
}
/* eslint-enable */
