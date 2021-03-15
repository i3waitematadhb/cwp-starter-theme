/* eslint-disable */
import $ from 'jquery';
import WOW from 'wow.js';
import jQueryBridget from 'jquery-bridget';
import Masonry from 'masonry-layout';
import isotope from 'isotope-layout';

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {
    animation();
    accordion();
    masonryLayout();
    navigation();
    judgesProfile();
  }

  function animation()
  {
    let wow = new WOW(
      {
        offset: 300,    // distance to the element when triggering the animation (default is 0)
        mobile: true,
        animateClass: 'page-section', // animation css class (default is animated)
        live: true,     // act on asynchronously loaded content (default is true)
        callback: function (section) {
          //section.classList.add('tex');
        },
        scrollContainer: null // optional scroll container selector, otherwise use window
      }
    );
    wow.init();
  }

  function accordion()
  {
    let accordion = $('.accordion-btn');
    accordion.click(function() {
      let panel = $(this).next('.panel');
      if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        panel.removeClass('active');
        panel.css('max-height', '0px');
      } else {
        $(this).addClass('active');
        panel.css('max-height', panel[0].scrollHeight + "px");
      }
    });
  }

  function judgesProfile()
  {
    $('.show-hide--btn').click(function() {
      if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        $(this).find('span').text('Show more');
        $(this).next('.judge-blurb').fadeOut();
      } else {
        $(this).addClass('active');
        $(this).find('span').text('Hide');
        $(this).next('.judge-blurb').fadeIn();
      }
    });
  }

  function masonryLayout()
  {
    // make Masonry a jQuery plugin
    jQueryBridget( 'masonry', Masonry, $ );
    // now you can use $().masonry()
    $('.grid').masonry({
      itemSelector: '.masonry-grid', // use a separate class for itemSelector, other than .col-
      columnWidth: '.grid-sizer',
      percentPosition: true
    });
  }

  function navigation()
  {
    let nav = $('.navbar-nav');
    let navItem = nav.find('.nav-item');
    navItem.mouseover(function () {
      $(this).addClass('hover-active');
      navItem.each(function() {
        if (!$(this).hasClass('hover-active')) {
          $(this).addClass('hover-inactive');
        }
      });
    }).mouseleave(function (){
      navItem.each(function() {
        $(this).removeClass('hover-inactive hover-active');
      });
    });
  }
}

/* eslint-enable */
