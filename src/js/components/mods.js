/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import WOW from 'wow.js';
import pagination from 'paginationjs';
import 'select2';
import FlexMasonry from 'flexmasonry/src/flexmasonry';
import NProgress from 'nprogress/nprogress';
import {shuffle} from "gsap/gsap-core";
// import fullpage from 'fullpage.js';

export default function () {
  let selectedFilters = [];
  $(document).ready(function ()
  {
    NProgress.configure({ showSpinner: false });
    initializeDocument();
  });

  //PageLoader
  $(window).on('load', function(){
    NProgress.start();
    setTimeout(function () {
      pageLoad();
      NProgress.done();
    }, 1000);
  });

  //Header
  let siteLogo = $('.site-logo');
  const body = document.body;
  const scrollUp = "scroll-up";
  const scrollDown = "scroll-down";
  let lastScroll = 0;
  window.addEventListener("scroll", () => {
    let topPos = $(window).scrollTop();
    let altLogo = siteLogo.attr('data-logo-alt');
    let logo = siteLogo.attr('data-logo');
    const currentScroll = window.pageYOffset;
    if (currentScroll <= 0) {
      body.classList.remove(scrollUp);
      siteLogo.attr('src', logo);
      return;
    }
    if (currentScroll > lastScroll && !body.classList.contains(scrollDown)) {
      // down
      console.log(topPos);
      if (topPos > 550) {
        body.classList.remove(scrollUp);
        body.classList.add(scrollDown);

      }
    } else if (
      currentScroll < lastScroll &&
      body.classList.contains(scrollDown)
    ) {
      // up
      if (topPos > 550) {
        body.classList.remove(scrollDown);
        body.classList.add(scrollUp);
        siteLogo.attr('src', altLogo);
      }
    }
    lastScroll = currentScroll;
  });

  function initializeDocument()
  {
    //Header
    HeaderSettings();
    HamburgerSettings();
    //Navigation();
    //NavReveal();
    //NavChildToggle();


    AnimationSettings();
    //BannerScrollSettings();
    //SimpleParallaxSettings();

    //Sections
    AccordionSection();
    BlogSection();
    CarouselSection();
    ImageBannerSection();
    ImageWithTextOverlaySection();
    MasonryContentSection();
    QIProjectListSection();
    QIFeedbackFormSection();
    RelatedProjectsSection();
    SliderBannerSection();
    VideoBannerSection();

    //Page
    projectList();
    resourcesLists();
    QualityImprovementSessionHolderPage();

    PreloadingSettings();

    //FullPage
    fullpageSettings();
  }

  function BannerScrollSettings()
  {
    $(window).scroll(function() {
      let scroll = $(window).scrollTop();
      $(".ImageBanner-container .project-banner img").css({
        transform: 'translate3d(-50%, -'+(scroll/100)+'%, 0) scale('+(100 + scroll/6)/100+')',
        height: 'calc(103vh - ' + scroll +'px)',
        filter: 'blur(' + (scroll/50) + 'px)',
        '-webkit-filter': 'blur(' + (scroll/50) + 'px)',
      });
    });
  }

  function HeaderSettings()
  {
    let header = $('header');
    //Navigation
    header.find('.navbar .nav-item').each(function() {
      $(this).mouseover(function() {
        header.find('.navbar').addClass('revealBg');
      }).mouseout(function () {
        header.find('.navbar').removeClass('revealBg');
      });
    });

    let dropdownMenu = $('.dropdown-items')
    dropdownMenu.find('li').each(function(i) {
      $(this).find('.dropdown-item').mouseover(function () {
        let img = $(this).find('img');

      }).mouseout(function() {
        let img = $(this).find('img');
      });
    });

    //links
    $('a').click(function (event) {
      let nav = $(this);
      event.preventDefault();
      $('.preloader').addClass('active');
      setTimeout(function () {
        window.location.href = nav.attr('href');
      }, 150);
    });
  }

  function HamburgerSettings()
  {
    let menu = $('.menu'),
        siteheader = $('.site-header'),
        navbackdrop = $('.navigation-backdrop'),
        primaryNav  = menu.find('.primaryNav');
    $('.hamburger').click(function() {
      if ($(this).hasClass('is-active')) {
        $(this).removeClass('is-active');
        siteheader.removeClass('open');
        menu.removeClass('open');
      } else {
        $(this).addClass('is-active');
        siteheader.addClass('open');
        menu.addClass('open');
        primaryNav.find('.primary-ul li').each(function (i) {
          if (i < 1 ) {
            let dropdownData = $(this).attr('data-dropdown');
            let panelNav = $('.panel__nav');
            panelNav.each(function () {
              if ($(this).attr('data-toggle') === dropdownData) {
                $(this).css({'display': 'block'});
              }
            });
          }
        });
      }
    });
  }

  function NavReveal()
  {
    const revealerNav = revealer({
      revealElementSelector: '.nav-js',
      options: {
        anchorSelector: '.hamburger',
      },
    });
    const actionBtn = document.querySelector('.hamburger');
    actionBtn.addEventListener('click', () => {
      if (!revealerNav.isRevealed()) {
        revealerNav.reveal();
        actionBtn.setAttribute('data-open', true);
      } else {
        revealerNav.hide();
        actionBtn.setAttribute('data-open', false);
      }
    });
  }

  function NavChildToggle()
  {
    $('.navbar-touch-caret').click(function() {
      let dataToggle = $(this).attr('data-toggle');
      let childMenu  = $('.child-menu');
      childMenu.each(function () {
        $(this).removeClass('open');
        if ($(this).attr('data-toggle') === dataToggle) {
          $(this).css({
            'visibility': 'visible'
          });
          $(this).animate({
            'right' : '0%'
          })
          $('.menu-items').animate({
            'left' : '-100%'
          });
        }
      });
    });
    $('.close-child-menu .go-back').click(function () {
      $(this).parent().parent('.child-menu').removeClass('open').animate({
        'right' : '-100%'
      });
      $('.menu-items').animate({
        'left' : '0%'
      });
    });
  }

  function Navigation()
  {
    let navigation = $('.navigation');
    let navItem = navigation.find('.navi-item');
    navItem.click(function () {
      navItem.removeClass('mobile-mode');
      if ($(this).hasClass('click-onmobile')) {
        $(this).parent().removeClass('mobile-mode');
        $(this).removeClass('click-onmobile');
      } else {
        navItem.each(function () {
          $(this).removeClass('click-onmobile');
        });
        $(this).parent().addClass('mobile-mode');
        $(this).addClass('click-onmobile');
      }
    })
    navItem.hover(function () {
      if ($(this).hasClass('first-item')) {
        siteLogo.addClass('inverted-logo');
      } else {
        siteLogo.removeClass('inverted-logo');
      }
      let dropdownMenu = $(this).find('.dropdown-menu');
      dropdownMenu.addClass('show');
      if (dropdownMenu.hasClass('show')) {
        dropdownMenu.find('.dropdown-menu-item').each(function (i) {
          let ctr = ((i + 1) * 100);
          let item = $(this);
          setTimeout(function () {
            item.addClass('reveal');
          }, ctr);
        });
      }
    }, function () {
      let dropdownMenu = $(this).find('.dropdown-menu');
      siteLogo.removeClass('inverted-logo');
      dropdownMenu.removeClass('show');
      dropdownMenu.find('.dropdown-menu-item').each(function (i) {
        let ctr = ((i + 1) * 100);
        let item = $(this);
        setTimeout(function () {
          item.removeClass('reveal');
        }, ctr);
      });
    });
    navItem.each(function () {
      $(this).find('.navi-link').click(function (e) {
        e.preventDefault();
        navigation.removeClass('open');
      });
    });
  }

  function AnimationSettings()
  {
    let wow = new WOW(
      {
        offset: 300,    // distance to the element when triggering the animation (default is 0)
        mobile: true,
        animateClass: 'animate__animated', // animation css class (default is animated)
        live: true,     // act on asynchronously loaded content (default is true)
        callback: function (box) {
          if (box.classList.contains('slide-left')) {
            box.classList.add('slide-started');
          }
          if (box.classList.contains('slide-right')) {
            box.classList.add('slide-started');
          }
        },
        scrollContainer: null // optional scroll container selector, otherwise use window
      }
    );
    wow.init();
  }

  function AccordionSection()
  {
    let acc = document.getElementsByClassName("accordion");
    let i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        this.parentElement.classList.toggle('selected');
        let panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
          panel.style.maxHeight = null;
        } else {
          panel.style.maxHeight = panel.scrollHeight + "px";
        }
      });
    }
  }

  function BlogSection()
  {
    let sectionBlog = $('.section-BlogList');
    if (sectionBlog.length > 0) {
      let sectionBlogSlider = sectionBlog.find('.owl-carousel');
      sectionBlogSlider.owlCarousel({
        items:2,
        loop:true,
        stagePadding: 300
        // autoplay:true,
        // autoplayTimeout:1000,
      });
      // let sectionBlogList = sectionBlog.find('.blog-navigation ul li');
      // sectionBlogList.each(function () {
      //   let blogItem = $(this).find('.blog-item');
      //   blogItem.hover(function () {
      //     $(this).parent('li').addClass('active');
      //   }, function () {
      //     $(this).parent('li').removeClass('active');
      //   });
      // });
    }
  }

  function CarouselSection()
  {
    let sectionCarousel = $('.section-Carousel');
    if (sectionCarousel.length > 0) {
      let sectionCarouselItem = sectionCarousel.find('.owl-carousel');
      sectionCarouselItem.owlCarousel({
        loop: !1,
        nav: !1,
        navText: ["<i class='fas fa-long-arrow-left'></i> PREV", "NEXT <i class='fas fa-long-arrow-right'></i>"],
        responsive: {
          0: {items: 1, stagePadding: 25, margin: 5, dots: true},
          580: {items: 1, stagePadding: 40, margin: 10, dots: true},
          767: {items: 1, stagePadding: 50, margin: 10, dots: !1, nav: !0},
          992: {items: 2, stagePadding: 10, margin: 15, dots: !1, nav: !0},
          1200: {items: 2, stagePadding: 10, margin: 15, dots: !1, nav: !0},
          1500: {items: 3, stagePadding: 10, margin: 28, dots: !1, nav: !0},
          1600: {items: 3, stagePadding: 10, margin: 28, dots: !1, nav: !0}
        }
      });
      sectionCarouselItem.find('.owl-item').each(function (i) {
        if (i !== 0) {
          let marginTop = (32 * i);
          let sliderItem = $(this).find('.carouselContent-item');
          sliderItem.css('margin-top', marginTop);
        }
      });
    }
  }

  function ImageBannerSection()
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

  function ImageWithTextOverlaySection()
  {
    // $(window).scroll(function() {
    //   let scroll = $(window).scrollTop();
    //   let scale = (scroll/8)/100;
    //   if (scale < 1 ) {
    //     $(".ImageWithTextOverlay-container .imageWithTextOverlay-image img").css({
    //       transform: 'scale(1)',
    //     });
    //   }
    //   if (scale > 1 && scale < 2) {
    //     $(".ImageWithTextOverlay-container .imageWithTextOverlay-image img").css({
    //       transform: 'scale('+(scroll/9)/100+')',
    //     });
    //   }
    // });
  }

  function MasonryContentSection()
  {
    FlexMasonry.init('.masonry-content', {
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

    let masonryContent = $('.masonry-content');
    if (masonryContent.length > 0) {
      let masonryItem = masonryContent.find('.masonry-item');
      masonryItem.scrollie({
        scrollOffset : -100,
        scrollingInView : function(elem, offset, direction, coords, scrollRatio, thisTop, winPos) {
          let bgColor = elem.data('bg');
          if (bgColor) {
            $('body').css({
              'background-color' : bgColor,
            });
          }
        }
      });
    }
  }

  function QIProjectListSection()
  {
    let sectionQIProjectList = $('.section-QIProjectList');
    if (sectionQIProjectList.length > 0) {
      let selectCategory = sectionQIProjectList.find('.select-category');
      selectCategory.select2({
        placeholder: 'Select a category'
      });

      //Dropdown Project Filter
      let dropdownProjectFilter = sectionQIProjectList.find('.project-filters #dropdown-year');
      dropdownProjectFilter.find('.dropdown-item').click(function() {
        let selectedYear = $(this).text();
        let dropdownToggle = dropdownProjectFilter.find('#dropdownYear');
        dropdownToggle.text(selectedYear);
      });
    }
  }

  function QIFeedbackFormSection()
  {
    let feedbackSection = $('.section-QIFeedback');
    if (feedbackSection.length > 0) {
      let dropdownRole = feedbackSection.find('.feedback-form #dropdown-role');
      dropdownRole.find('.dropdown-item').click(function() {
        let selectedRole = $(this).text();
        let dropdownToggle = dropdownRole.find('#dropdownRole');
        dropdownToggle.text(selectedRole);
      });
    }
  }

  function RelatedProjectsSection()
  {
    let sectionRelatedProjects = $('.section-RelatedProjects');
    if (sectionRelatedProjects.length > 0) {
      let sectionRelatedProjectsItem = sectionRelatedProjects.find('.owl-carousel');
      sectionRelatedProjectsItem.owlCarousel({
        loop: false,
        nav: true,
        navText: ["<i class='fas fa-long-arrow-left'></i> PREV", "NEXT <i class='fas fa-long-arrow-right'></i>"],
        responsive: {
          0: {items: 1, stagePadding: 5, margin: 10, dots: true},
          580: {items: 1, stagePadding: 5, margin: 15, dots: true},
          767: {items: 1, stagePadding: 15, margin: 15, dots: !1, nav: !0},
          992: {items: 1, stagePadding: 15, margin: 15, dots: !1, nav: !0},
          1200: {items: 1, stagePadding: 30, margin: 18, dots: !1, nav: !0},
          1500: {items: 2, stagePadding: 10, margin: 28, dots: !1, nav: !0},
          1600: {items: 3, stagePadding: 10, margin: 28, dots: !1, nav: !0}
        }
      });
      sectionRelatedProjectsItem.find('.owl-item').each(function (i) {
        if (i !== 0) {
          let marginTop = (32 * i);
          let sliderItem = $(this).find('.relatedProjects-item');
          sliderItem.css('margin-top', marginTop);
        }
      });
    }
  }

  function SliderBannerSection()
  {
    let sectionSliderBanner = $('.section-SliderBanner');
    if (sectionSliderBanner.length > 0) {
      let sectionSliderBannerItem = sectionSliderBanner.find('.owl-carousel');
      sectionSliderBannerItem.owlCarousel({
        items:1,
        loop:true,
        autoplay:true,
        autoplayTimeout:1000,
      });
    }
  }

  function VideoBannerSection()
  {
    let sectionVideoBanner = $('.section-VideoBanner');
    if (sectionVideoBanner.length > 0) {
      let bannerHeight = sectionVideoBanner.find('#video-content').height();
      $(window).scroll(function () {
        let scrollTop = $(window).scrollTop();
        let opacity   = scrollTop / 500;
        let scale     = scrollTop * .0004 + 1;
        let title     = scrollTop * .4;
        let mouseScroll  = sectionVideoBanner.find('.mouseScroll');
        let bannerVideo  = sectionVideoBanner.find('#video-content');
        let bannerText   = sectionVideoBanner.find('.videoBanner-content');
        if (scrollTop < 630) {
          bannerVideo.css({
            transform: 'scale('+scale+')',
            //filter: 'blur('+ (scrollTop/50) +'px)',
            opacity: 'calc(1.5 - '+ opacity +')',
            height: 'calc(' + bannerHeight + 'px - ' + scrollTop/100 + 'vh)'
          });

          bannerText.css({"margin-top": title + "px", opacity: 'calc(1 - '+ opacity +')'});
          mouseScroll.css({opacity: 'calc(1 - '+ opacity +')'});
        }
      });
    }
  }

  function QualityImprovementSessionHolderPage()
  {
    let pageBody = $('.QISessionHolderPage');
    if (pageBody.length > 0) {
      let selectCategory = pageBody.find('.select-category');
      selectCategory.select2({
        placeholder: 'Select a category'
      });
      callAPIEndpoint('ajax/getAllQualityImprovementSessions', 'Get' ,null, function (result){
        if (!result.error) {
          createPaginationForQISessions(result.data)
        }
      });
    }
  }

  function createPaginationForQISessions(data)
  {
    let projectItems = $('.paginated-sessions .row');
    $('.paginate-action').pagination({
      dataSource: data,
      locator: 'items',
      totalNumber: 30,
      pageSize: 8,
      prevText: 'PREV',
      nextText: 'NEXT',
      callback: function(data, pagination) {
        // template method of yourself
        let column = createColumnForQISessions(data);
        projectItems.empty();
        projectItems.prepend(column);
      }
    });
  }

  function createColumnForQISessions(data)
  {
    let column = '';
    let ctr = 0;
    data.forEach(function (i){
      let categories = i.categories;
      let authors  = i.authors;
      let categorySpan = '';
      let authorSpan = '';

      categories.forEach(function (i) {
        categorySpan += '<span class="session-category badge badge-pill badge-light m-1">' + i + '</span>';
      });

      authors.forEach(function (i) {
        authorSpan += '<span class="session-author badge badge-pill badge-light m-1">' + i + '</span>';
      });

      column +=
        '<div class="col-md-4 wow animate__animated animate__fadeInUp session-content" data-wow-delay="0.' + ctr +'s">' +
        '<div class="session-item">' +
        '<div class="session-item__image">' +
        '<a href="' + i.link + '" class="text-decoration-none">' +
        '<img src="' + i.image + '" class="" alt="' + i.imageAlt + '">' +
        '</a>' +
        '</div>' +
        '<div class="session-item__content">' +
        '<div class="session-title">' +
        '<a href="' + i.link + '" class="text-decoration-none">' +
        '<h6 class="text-dark font-weight-bold mb-md-3">' + i.title + '</h6>' +
        '</a>' +
        '</div>' +
        '<div class="session-date"><span class="theme-text-gradient font-weight-bold"><i class="fal fa-calendar-alt"></i>' + i.date + '</span></div>' +
        '<div class="session-time"><span class="theme-text-gradient font-weight-bold"><i class="fal fa-clock"></i>' + i.time + '</span></div>' +
        '<div class="session-location"><span class="theme-text-gradient font-weight-bold"><i class="fal fa-map-marker-alt"></i>' + i.location + '</span></div>' +
        // '<div class="session-categories">' + categorySpan + '</div>' +
        '<div class="session-summary"><span>' + i.summary + '</span></div>' +
        '<div class="session-link"><a href="' + i.link + '" class="theme-button-gradient text-decoration-none"><span class="font-weight-light">View session</span></a></div>' +
        '</div>' +
        '</div>' +
        '</div>';
      ctr = ctr + 1;
    });

    return column;
  }

  function pageLoader()
  {
    let layerClass = ".right-layer";
    let layers = document.querySelectorAll(layerClass);
    let ctr = 1;
    for (const layer of layers) {
      layer.classList.toggle("active");
      if (layers.length === ctr) {
        setTimeout(function() {
          $('body').removeClass('active-loader');
        }, 1000);

      }
      ctr = ctr + 1;
    }
  }

  function projectList()
  {
    let projectList = $('.project-lists');
    if (projectList.length > 0) {
      let pageType = projectList.attr('data-type');
      let categories = [];
      let dropdownProjectFilter = projectList.find('.project-filters #dropdown-year');
      dropdownProjectFilter.find('.dropdown-item').click(function () {
        let selectedYear = $(this).text();
        let dropdownToggle = dropdownProjectFilter.find('#dropdownYear');
        let stringifyCategories = JSON.stringify(categories);
        dropdownToggle.text(selectedYear);
        callAPIEndpoint('ajax/getProjectsByFilter', 'POST',
          'categories=' + encodeURIComponent(stringifyCategories) + '&year=' + selectedYear + '&type=' + pageType, function (result) {
            if (result.data.length) {
              createPaginationForProjects(result.data);
            } else {
              noResultsFound('projects');
            }
          });
      });

      let selectCategory = projectList.find('.select-category');
      selectCategory.select2({
        placeholder: 'Select a category'
      });

      selectCategory.on("select2:select", function (e) {
        let selectedCategory, stringifyCategories, selectedYear;
        selectedYear = dropdownProjectFilter.find('#dropdownYear').text();
        selectedCategory = e.params.data;
        categories.push(selectedCategory.text);
        stringifyCategories = JSON.stringify(categories);
        callAPIEndpoint('ajax/getProjectsByFilter', 'POST',
          'categories=' + encodeURIComponent(stringifyCategories) + '&year=' + selectedYear + '&type=' + pageType, function (result) {
            if (result.data.length) {
              createPaginationForProjects(result.data);
            } else {
              noResultsFound('projects');
            }
          });
      });

      /**
       *  Unselect category
       */
      selectCategory.on("select2:unselect", function (e) {
        let deletedCategory, stringifyCategories, selectedYear, index;
        selectedYear = dropdownProjectFilter.find('#dropdownYear').text();
        deletedCategory = e.params.data;
        index = categories.indexOf(deletedCategory.text);
        if (index > -1) {
          categories.splice(index, 1);
          stringifyCategories = JSON.stringify(categories);
          callAPIEndpoint('ajax/getProjectsByFilter', 'POST',
            'categories=' + encodeURIComponent(stringifyCategories) + '&year=' + selectedYear + '&type=' + pageType, function (result) {
            if (result.data.length) {
              createPaginationForProjects(result.data);
            } else {
              noResultsFound('projects');
            }
          });
        }
      });

      callAPIEndpoint('ajax/getAllProjects','POST', 'type=' + pageType, function (result) {
        if (!result.error) {
          createPaginationForProjects(result.data)
        }
      });
    }
  }

  function noResultsFound(type)
  {
    let row, column, pagination;
    pagination = $('.paginate-action');
    (type === 'projects') ? row = $('.paginated-projects .row') : [row = $('.paginated-resources'), row.css('height', 'auto')];
    column = '<div class="col-md-12 pt-5 pb-5"><p class="text-center display-4"><i>No matching records found.</i></p></div>';
    pagination.empty();
    row.empty();
    row.append(column);
  }

  function createPaginationForProjects(data)
  {
    let projectItems = $('.paginated-projects .row');
    $('.paginate-action').pagination({
      dataSource: data,
      locator: 'items',
      totalNumber: 30,
      pageSize: 8,
      prevText: 'PREV',
      nextText: 'NEXT',
      callback: function(data, pagination) {
        // template method of yourself
        let column = createColumnForProjects(data);
        projectItems.empty();
        projectItems.prepend(column);
      }
    });
  }

  function createColumnForProjects(data)
  {
    let column = '';
    let ctr = 0;
    data.forEach(function (i){
      let categories = i.categories;
      let categorySpan = '';
      categories.forEach(function (i) {
        categorySpan += '<span class="project-category badge badge-pill badge-light m-1">' + i + '</span>';
      });
      column +=
        '<div class="col-md-3 wow animate__animated animate__fadeInUp project-content" data-wow-delay="0.' + ctr +'s">' +
          '<a href="' + i.link + '">' +
            '<div class="project-item">' +
              '<div class="project-item__image">' +
                '<img src="' + i.image + '" class="" alt="' + i.imageAlt + '">' +
              '</div>' +
              '<div class="project-item__content">' +
                '<div class="project-title">' +
                  '<h5 class="text-white font-weight-semibold mb-md-3">' + i.title + '</h5>' +
                '</div>' +
                '<div class="project-categories">' + categorySpan + '</div>' +
              '</div>' +
            '</div>' +
          '</a>' +
        '</div>';
      ctr = ctr + 1;
    });
    return column;
  }

  function resourcesLists()
  {
    let resourcesFilter = $('.resources-filters');
    if (resourcesFilter.length > 0) {
      let index, stringifyFilters, resourcesPageID = resourcesFilter.find('#page-id').val();
      let selectCategory = resourcesFilter.find('.resources-categories');
      selectCategory.select2({
        placeholder: 'Select a category'
      });
      selectCategory.on("select2:select", function (e) {
        let selectedCategory = e.params.data.text;
        selectedFilters.push(selectedCategory);
        stringifyFilters = JSON.stringify(selectedFilters);
        callAPIEndpoint('ajax/getFilteredResources','POST','filters=' + encodeURIComponent(stringifyFilters) + '&resourcesPageID=' + resourcesPageID, function (result) {
          if (result.data.length) {
            createPaginationForResources(result.data);
          } else {
            noResultsFound('resources');
          }
        });
      });
      selectCategory.on("select2:unselect", function (e) {
        let removedCategory = e.params.data.text;
        index = selectedFilters.indexOf(removedCategory);
        if (index > -1) {
          selectedFilters.splice(index, 1);
          stringifyFilters = JSON.stringify(selectedFilters);
          callAPIEndpoint('ajax/getFilteredResources','POST','filters=' + encodeURIComponent(stringifyFilters) + '&resourcesPageID=' + resourcesPageID, function (result) {
            if (result.data.length) {
              createPaginationForResources(result.data);
            } else {
              noResultsFound('resources');
            }
          });
        }
      });
      callAPIEndpoint('ajax/getAllResources','POST', 'resourcesPageID=' + resourcesPageID, function (result) {
        if (!result.error) {
          if (result.data.length) {
            createPaginationForResources(result.data)
          } else {
            noResultsFound('resources');
          }
        }
      });
    }
  }

  function createPaginationForResources(data)
  {
    let resourcesItem = $('.paginated-resources');
    $('.paginate-action').pagination({
      dataSource: data,
      locator: 'items',
      totalNumber: 30,
      pageSize: 9,
      prevText: 'PREV',
      nextText: 'NEXT',
      callback: function(data, pagination) {
        //Template method of yourself
        let column = createColumnForResources(data);
        resourcesItem.empty();
        resourcesItem.prepend(column);

        //Load functions
        showResourcesAbstract();
        resourcesTagClick();
        masonryLayout();
      }
    });
  }

  function createColumnForResources(data)
  {
    let column = '';
    let ctr = 0;
    data.forEach(function (i){
      let abstractColumn = '', categoryColumn = '', authorColumn = '';
      if (i.abstract) {
        abstractColumn += '<div class="resource-abstract"><button class="read-abstract"><span class="ff-clan font-weight-semibold theme-text-gradient">Read abstract</span></button><div class="abstract-content">' + i.abstract + '</div></div>';
      }
      if (i.authors) {
        i.authors.forEach(function(i, idx, array){
          if (idx === array.length - 1) {
            authorColumn += "<span class='resource-author'>" + i + "</span>";
          } else {
            authorColumn += "<span class='resource-author'>" + i + ",&nbsp;</span>";
          }
        });
      }
      if (i.categories) {
        i.categories.forEach(function(i, idx,array){
          categoryColumn += "<button class='resource-category'><span class=''>" + i + "</span></button>";
        });
      }
      column +=
        '<div class="resource-item wow animate__animated animate__fadeInUp" data-wow-delay="0.' + ctr +'s">' +
          '<div class="resource-item__content">' +
            '<div class="resource-title">' +
              '<h6 class="text-dark font-weight-bold mb-md-3">'+ i.title +'</h6>' +
            '</div>' +
            '<div class="resource-content mb-4">'+ i.content +'</div>' +
            '<div class="resources-authors text-dark"><span class="font-weight-bold">Posted by: </span>' + authorColumn + '</div>' +
            '<div class="resources-categories text-dark mt-3"><span class="font-weight-bold">Tags: </span>' + categoryColumn + '</div>' +
            abstractColumn +
          '</div>' +
        '</div>';
      ctr = ctr + 1;
    });
    return column;
  }
  function showResourcesAbstract()
  {
    let abstractBtn = $('.read-abstract');
    abstractBtn.click(function (){
      if ($(this).hasClass('active')) {
        $(this).removeClass('active');
        $(this).find('span').text('Read Abstract');
        $(this).next('.abstract-content').hide();
        masonryLayout();
      } else {
        $(this).addClass('active');
        $(this).find('span').text('Hide');
        $(this).next('.abstract-content').show();
        masonryLayout();
      }
    });
  }

  function resourcesTagClick()
  {
    let tag = $('.resource-category');
    tag.click(function() {
      let tag = $(this).find('span').text();
      let resourcesPageID = $('#page-id').val();
      callAPIEndpoint('ajax/findTagsParent', 'POST', 'tag=' + encodeURIComponent(tag) + '&resourcesPageID=' + resourcesPageID, function (result) {
        let dropdownFilter = $('#dropdown-'+result.data.tagID)
        let isTagExist = selectedFilters.indexOf(result.data.tagName);
        if (isTagExist === -1) {
          selectedFilters.push(result.data.tagName)
          dropdownFilter.val(selectedFilters);
          dropdownFilter.trigger('change');
        }

        //API call
        let stringifyFilters = JSON.stringify(selectedFilters);
        callAPIEndpoint('ajax/getFilteredResources','POST','filters=' + encodeURIComponent(stringifyFilters) + '&resourcesPageID=' + resourcesPageID, function (result) {
          if (result.data.length) {
            createPaginationForResources(result.data);
          } else {
            noResultsFound('resources');
          }
        });
      });
    });
  }

  function masonryLayout()
  {
    FlexMasonry.init('.paginated-resources', {
      responsive: true,
      breakpointCols: {
        'min-width: 1500px': 3,
        'min-width: 1200px': 3,
        'min-width: 992px': 2,
        'min-width: 768px': 2,
        'min-width: 576px': 1,
      },
      numCols: 3
    });
  }

  function pageLoad()
  {
    let pageLoader = $('.page-loader');
    pageLoader.addClass('hide');
    setTimeout(function () {
      pageLoader.empty();
    },2000);
  }

  function PreloadingSettings()
  {
    // Typerwrite text content. Use a pipe to indicate the start of the second line "|".
    let textArray = [
      "ideas.",
      "creativity.",
      "health outcomes.",
      "patient experience.",
    ];

    //Run the loop
    typeWriter("output", shuffle(textArray));
  }
  // values to keep track of the number of letters typed, which quote to use. etc. Don't change these values.
  let i = 0,
    a = 0,
    isBackspacing = false,
    isParagraph = false;
  // Speed (in milliseconds) of typing.
  let speedForward = 100, //Typing Speed
    speedWait = 1000, // Wait between typing and backspacing
    speedBetweenLines = 1000, //Wait between first and second lines
    speedBackspace = 25; //Backspace Speed
  function typeWriter(id, ar) {
    let element = $("#" + id),
      randArray=  Math.floor(Math.random() * ar.length),
      aString = ar[a],
      eHeader = element.children("h1"), //Header element
      eParagraph = element.children("p"); //Subheader element

    // Determine if animation should be typing or backspacing
    if (!isBackspacing) {

      // If full string hasn't yet been typed out, continue typing
      if (i < aString.length) {

        // If character about to be typed is a pipe, switch to second line and continue.
        if (aString.charAt(i) === "|") {
          isParagraph = true;
          eHeader.removeClass("cursor");
          eParagraph.addClass("cursor");
          i++;
          setTimeout(function(){ typeWriter(id, ar); }, speedBetweenLines);

          // If character isn't a pipe, continue typing.
        } else {
          // Type header or subheader depending on whether pipe has been detected
          if (!isParagraph) {
            eHeader.text(eHeader.text() + aString.charAt(i));
          } else {
            eParagraph.text(eParagraph.text() + aString.charAt(i));
          }
          i++;
          setTimeout(function(){ typeWriter(id, ar); }, speedForward);
        }

        // If full string has been typed, switch to backspace mode.
      } else if (i === aString.length) {

        isBackspacing = true;
        setTimeout(function(){ typeWriter(id, ar); }, speedWait);
      }

      // If backspacing is enabled
    } else {

      // If either the header or the paragraph still has text, continue backspacing
      if (eHeader.text().length > 0 || eParagraph.text().length > 0) {

        // If paragraph still has text, continue erasing, otherwise switch to the header.
        if (eParagraph.text().length > 0) {
          eParagraph.text(eParagraph.text().substring(0, eParagraph.text().length - 1));
        } else if (eHeader.text().length > 0) {
          eParagraph.removeClass("cursor");
          eHeader.addClass("cursor");
          eHeader.text(eHeader.text().substring(0, eHeader.text().length - 1));
        }
        setTimeout(function(){ typeWriter(id, ar); }, speedBackspace);

        // If neither head or paragraph still has text, switch to next quote in array and start typing.
      } else {
        isBackspacing = false;
        i = 0;
        isParagraph = false;
        a = (a + 1) % ar.length; //Moves to next position in array, always looping back to 0
        setTimeout(function(){ typeWriter(id, ar); }, 50);
      }
    }
  }

  function fullpageSettings()
  {

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
