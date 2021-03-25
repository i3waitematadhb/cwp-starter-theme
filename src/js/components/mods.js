/* eslint-disable */
import $ from 'jquery';
import WOW from 'wow.js';
import 'owl.carousel.es6';
import tab from "bootstrap/js/src/tab";

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {

    animation();

    //Cardiology Page
    slider();
    openTab();
    videoPlay();
    googleAnalytics();
  }

  function animation()
  {
    let wow = new WOW(
      {
        offset: 300,    // distance to the element when triggering the animation (default is 0)
        live: true,     // act on asynchronously loaded content (default is true)
        callback: function (section) {
          //section.classList.add('tex');
        },
        scrollContainer: null // optional scroll container selector, otherwise use window
      }
    );
    wow.init();
  }

  function slider()
  {
    // Slider Button Nav
    let navButton = $('.nav-button');
    navButton.click(function () {
      let btnID   = $(this).attr('data-id');
      let btnName = $(this).attr('data-name');
      navButton.each(function() {
        $(this).removeClass('active');
      });
      $(this).addClass('active');

      $('.owl-item').each(function (itemID) {
        let slideContent = $(this).find('.slide-content');
        if (slideContent.attr('id') === btnID) {
          if (!$(this).hasClass('active')) {
            $(this).addClass('active');
            $('.owl-dots .owl-dot').each(function (i) {
              if (itemID === i) {
                $(this).trigger('click');
              }
            });
          }
        } else {
          $(this).removeClass('active');
        }
      });

      //googleAnalytics
      gtag('event', 'Navigation Click - ' + btnName, {
        'event_category': 'navigation_click',
        'event_label': 'navigation',
        'value': 'Navigation Click - ' + btnName
      });
    });

    // Carousel settings
    $('.owl-carousel').owlCarousel({
      loop:false,
      margin:20,
      responsiveClass:true,
      responsive:{
        0:{
          items:1,
        },
        600:{
          items:1,
          nav:false,
          loop:false
        },
        1000:{
          items:1,
        }
      },
      onDragged: callback,
    });
  }

  function callback(event)
  {
    let event_drag_index = event.item.index;
    $('.nav-button').each(function (index) {
      $(this).removeClass('active');
      if (index === event_drag_index) {
        $(this).addClass('active');
      }
    });
  }

  function openTab() {
    // Declare all variables
    let tabcontent, tablinks;
    tablinks = $('.tablinks');
    tablinks.click(function () {
      let dataid = $(this).attr('data-id');

      // Get all elements with class="tablinks" and remove the class "active"
      tablinks.each(function () {
        $(this).removeClass('active');
      });

      // Get all elements with class="tabcontent" and hide them
      tabcontent = $('.tabcontent');
      tabcontent.each(function () {
        $(this).css('display', 'none');
      });

      $('#tabcontent'+dataid).css('display', 'block');
      $('#tab'+dataid).addClass('active');
    });
  }

  function videoPlay()
  {
    let tabcontent, btn, btnIcon, video, videoSrc;
    let countPlay = 0;
    tabcontent = $('.tabcontent');
    tabcontent.find('.btn-play').click(function () {
      btn = $(this);
      btnIcon  = btn.find('i');
      video    = btn.next();
      videoSrc = video.currentSrc;

      if (btn.hasClass('on')) {
        btn.removeClass('on');
        btnIcon.removeClass('fa-pause-circle').addClass('fa-play-circle');
        video.removeClass('playing').get(0).pause();
      } else {
        btn.addClass('on');
        btnIcon.removeClass('fa-play-circle').addClass('fa-pause-circle');
        video.addClass('playing').get(0).play();
        video.attr('controls',true);
        countPlay = 1
      }
      video.on('ended', function () {
        btnIcon.removeClass('fa-pause-circle').addClass('fa-play-circle');
        video.get(0).load();
      });
    });

    if (countPlay === 1) {
      gtag('event', 'Video play count', {
        'event_category': 'video_play',
        'event_label': 'video',
        'value': 'Video play count'
      });
    }
  }

  function googleAnalytics()
  {
    $('a').click(function () {
      let text = $(this).find('span').text();
      gtag('event', 'User link click - ' + text, {
        'event_category': 'link_click',
        'event_label': 'link',
        'value': 'User link click - ' + text
      });
    });
  }
}

/* eslint-enable */
