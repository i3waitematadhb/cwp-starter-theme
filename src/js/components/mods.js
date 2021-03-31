/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import WOW from 'wow.js';
import pagination from 'paginationjs';
import simpleParallax from 'simple-parallax-js';

export default function () {
  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {

    //Header
    HamburgerSettings();
    Navigation();

    //Animation
    AnimationSettings();
    BackgroundSettings();

    simpleParallaxSettings();

    //Sections
    AccordionSection();
    BlogSection();
    CarouselSection();
    QIProjectListSection();
    QIFeedbackFormSection();
    RelatedProjectsSection();
    SliderBannerSection();

    //Page
    ProjectList();
    QualityImprovementSessionHolderPage();
  }

  function HamburgerSettings()
  {
    $('.hamburger').click(function() {
      if ($(this).hasClass('is-active')) {
        $(this).removeClass('is-active');
        $('.navigation').removeClass('open');
      } else {
        $(this).addClass('is-active');
        $('.navigation').addClass('open');
      }
    });
  }

  function Navigation()
  {
    let siteLogo = $('.site-logo');
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
        console.log('gdfgdg');
        e.preventDefault();
        navigation.removeClass('open');
      });
    });
  }

  function BackgroundSettings()
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

  function simpleParallaxSettings()
  {
    let imageParallax = document.getElementsByClassName('parallax-image');
    new simpleParallax(imageParallax, {
      delay: .5,
      transition: 'cubic-bezier(0,0,0,1)'
    })
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
          992: {items: 2, stagePadding: 5, margin: 15, dots: !1, nav: !0},
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
          console.log(result);
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

  function ProjectList()
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
            console.log(result);
            if (result.data.length) {
              createPaginationForProjects(result.data);
            } else {
              noResultsFound();
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
            console.log(result);
            if (result.data.length) {
              createPaginationForProjects(result.data);
            } else {
              noResultsFound();
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
              console.log(result);
              if (result.data.length) {
                createPaginationForProjects(result.data);
              } else {
                noResultsFound();
              }
            });
        }
      });

      callAPIEndpoint('ajax/getAllProjects','POST', 'type=' + pageType, function (result) {
        console.log(result);
        if (!result.error) {
          createPaginationForProjects(result.data)
        }
      });
    }
  }

  function noResultsFound()
  {
    let pagination = $('.paginate-action');
    let row = $('.paginated-projects .row');
    let column = '<div class="col-md-12 pt-5 pb-5"><p class="text-center display-4"><i>No matching records found.</i></p></div>';
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
        '<h4 class="text-white font-weight-bold mb-md-3">' + i.title + '</h4>' +
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
