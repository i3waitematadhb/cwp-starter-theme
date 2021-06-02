/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import WOW from 'wow.js';
import 'fullpage.js/vendors/easings.min';
import 'fullpage.js/vendors/scrolloverflow.min';
import fullpage from 'fullpage.js/dist/fullpage.extensions.min';
import FlexMasonry from 'flexmasonry/src/flexmasonry';

export default function () {
  $(document).ready(function ()
  {
    initialiseDocument();
  });

  function initialiseDocument()
  {
    //Header
    hamburgerSettings();

    //Section
    animationSettings();
    //scrollieSettings();

    sectionImageBanner();
    sectionMasonryContent();

    //FullPage
    fullpageSettings();
  }

  //Header
  function hamburgerSettings()
  {
    let hamburger = $('.hamburger');
    let navMenu   = $('.navigation');
    hamburger.click(function() {
      if ($(this).hasClass('is-active')) {
        $(this).removeClass('is-active');
        navMenu.hide();
      } else {
        $(this).addClass('is-active');
        navMenu.show();
      }
    });
  }

  //Animations
  function animationSettings()
  {
    let wow = new WOW(
      {
        offset: 400,    // distance to the element when triggering the animation (default is 0)
        mobile: true,
        animateClass: 'animate__animated', // animation css class (default is animated)
        live: true,     // act on asynchronously loaded content (default is true)
        callback: function (section) {
          console.log(section);
        },
        scrollContainer: null // optional scroll container selector, otherwise use window
      }
    );
    wow.init();
  }

  function scrollieSettings()
  {
    let section = $('.page-section');
    section.scrollie({
      scrollingInView : function(elem, offset, direction, coords, scrollRatio, thisTop, winPos) {
        let bgColor = elem.data('bg');
        if (bgColor) {
          $('body').css({
            //'background-color' : bgColor,
          });
        }
      }
    });
  }

  //Sections
  /** Image Banner **/
  function sectionImageBanner()
  {
    let imageBanner = $('.section-ImageBanner');
    if (imageBanner.length > 0) {
      $(window).scroll(function () {
        let scrollTop = $(window).scrollTop();
        let opacity   = scrollTop / 500;
        let scale     = scrollTop * .0004 + 1;
        let title     = scrollTop * .4;
        let position  =  100 - (scrollTop / 20);
        let bannerImage = imageBanner.find('.image-banner--image');
        let bannerText  = imageBanner.find('.image-banner--text');
        let mouseScroll = imageBanner.find('.mouseScroll');
        // bannerImage.parent('.section-content').css({
        //   height: 'calc('+ bannerImage.data('height') + 'vh - ' + scrollTop + 'px)',
        // });
        bannerImage.css({
          transform: 'scale('+scale+')',
          filter: 'blur('+ (scrollTop/50) +'px)',
          "background-position": 'center '+position+'%'
        });
        bannerText.css({"margin-top": title + "px", opacity: 'calc(1 - '+ opacity +')'});
        //bannerText.css({opacity: 'calc(1 - '+ opacity +')'});
        mouseScroll.css({opacity: 'calc(1 - '+ opacity +')'});
      });
    }
  }

  /** Masonry Content **/
  function sectionMasonryContent()
  {
    FlexMasonry.init('.grid', {
      responsive: true,
      breakpointCols: {
        'min-width: 1500px': 2,
        'min-width: 1200px': 2,
        'min-width: 992px': 2,
        'min-width: 768px': 2,
        'min-width: 576px': 1,
      },
      numCols: 2
    });
  }

  //FullPage
  function fullpageSettings()
  {
    new fullpage('.fullPage-enabled', {
      //options here
      licenseKey: '2AE8017F-584546CA-AAD1AA0F-28DECE26',
      scrollingSpeed: 1000,
      keyboardScrolling: true,
      navigation: true,
      scrollBar: true,
      autoScrolling:true,
      easing: 'easeInOutCubic',
      scrollHorizontally: true,
      onLeave: function(origin, destination, direction){
        let destinationID = $('#'+destination.item.id);
        let bgColor = destinationID.data('bg');
        destinationID.addClass('skew');
        $('body').css({
          'background-color' : bgColor,
        });
      },
      afterLoad: function(origin, destination, direction){
        // let destinationID = $('#'+destination.item.id);
        // destinationID.removeClass('skew');
      },
    });
  }
}
/* eslint-enable */
