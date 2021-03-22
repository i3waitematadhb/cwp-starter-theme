/* eslint-disable */
import $ from 'jquery';
import 'owl.carousel';
import WOW from 'wow.js';
import ApexCharts from 'apexcharts';

export default function () {
  let hasManyFormFieldValueObj = {},
      hasOneFormFieldValueObj = {};
  let getFormFirstMonth = [];

  $(document).ready(function ()
  {
    initializeDocument();
  });

  function initializeDocument()
  {
    //Section Settings
    sectionBanner();
    sectionCarousel();
    animation();

    //Dashboard Settings
    dataTables();
    tableActionBtn();

    //DatePicker
    datePickerSettings();

    //Dashboard
    populateDashboardWhenPageLoads();
    dropdownPeriodSelector();
    dropdownModuleSelector();

    //Form
    moduleForm();
    removeFieldError()

    //dropdownEthnicity();

    //Admin Front-end
    adminDataTables();
  }

  function animation()
  {
    let wow = new WOW(
      {
        offset: 300,    // distance to the element when triggering the animation (default is 0)
        mobile: true,
        animateClass: 'animate__animated', // animation css class (default is animated)
        live: true,     // act on asynchronously loaded content (default is true)
        callback: function (section) {
          //section.classList.add('tex');
        },
        scrollContainer: null // optional scroll container selector, otherwise use window
      }
    );
    wow.init();
  }

  function sectionBanner()
  {
    let sliderBanner = $('.SliderBanner');
    if (sliderBanner.length > 0) {
      sliderBanner.find('.owl-carousel').owlCarousel({
        items: 1,
        dots: false
      })
    }
  }

  function sectionCarousel()
  {
    let carousel = $('#Carousel');
    if (carousel.length > 0) {
      carousel.owlCarousel(
        {
          items: 4,
          loop: true,
          nav: true,
          lazy: true,
        }
      )
    }
  }

  function dataTables()
  {
    let dataTable, table = $('#datatable');

    if (table.length > 0) {
      dataTable = table.DataTable({
        "columnDefs": [{
          "targets": 0,
          "data": null,
          "orderable": false,
          "className": 'details-control',
          "defaultContent": ' '
        }]
      });

      $('#datatable tbody').on('click', 'td.details-control', function () {
        let tr = $(this).closest('tr');
        let row = dataTable.row(tr);
        if ( row.child.isShown() ) {
          // This row is already open - close it
          row.child.hide();
          tr.removeClass('shown');
        } else {
          // Open this row
          row.child(dataTableFormat(row.data()),'p-0').show();
          tr.addClass('shown');
        }
      });
    }
  }

  function dataTableFormat(rowData)
  {
    let div = $('<div/>')
      .addClass('loading child-table')
      .text( 'Loading...' );
    callAPIEndpoint('ajax/populateTableRowDetails', 'POST', 'id=' + rowData[1], function (result) {
      if (!result.error) {
        let data = result.data;
        console.log(data);
        if (data.length > 0)
        {
          let arrangedLabel = [];
          let arrangeData = [];
          let table = '<table class="child-infoTable" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
          let ctr = 1;
          data.forEach(function (i) {
            //let id   = i.id;
            let name = i.name;
            let responses = i.responses;
            if (ctr === 1) {
              table += '<tr><td><p class="response-title">#</p></td>';
              responses.forEach(function (i) {
                let label = i.label;
                table += '<td><p class="response-title">' + label + '</p></td>';
                arrangedLabel.push(label);
              });
            }
            table += '<tr><td class="item-title"><p class="response-data">' + name + '</p></td>';
            //Arrange responses
            responses.forEach(function (i) {
              let label    = i.label;
              let response = i.response;
              let ind = arrangedLabel.indexOf(label);
              arrangeData[ind] = response;
            });
            //Arranged result
            if (arrangeData.length > 0) {
              arrangeData.forEach(function (i) {
                let response = i;
                if (Array.isArray(response)) {
                  table += '<td><p class="response-data">';
                  response.forEach(function (i) {
                    table +=  i.name + '<br><b>' + i.subresponse + '</b><br>';
                  });
                  table += '</td>';
                } else {
                  table += '<td><p class="response-data">' + response + '</p></td>';
                }
              });
            }
            table += '<td><button class="tbl-action-btn" data-type="edit-row" data-id="'+ data.id +'"><i class="fad fa-file-edit"></i></button></td>'
            table += '</tr>';
            ctr = ctr + 1;
          });
          table += '</table>';
          div.html(table);
        } else {
          let table = '<table class="child-infoTable" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            '<tr><td><p class="mb-0 medium">No data available in table</p></td>' +
            '</table>';
          div.html(table);
        }
      } else {
        let table = '<table class="child-infoTable" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
          '<tr><td><p class="mb-0">No data available in table</p></td>' +
          '</table>';
        div.html(table);
      }
    });
    return div
  }

  function tableActionBtn()
  {
    let table = $('#datatable');
    let btnAction = table.find('.tbl-action-btn');
    btnAction.click(function () {
      let id = $(this).attr('data-id');
      let moduleID = $(this).attr('data-module-id');
      let actionType = $(this).attr('data-type');
      if (actionType === 'edit-row') {
        callAPIEndpoint('ajax/addEntryToExistingSubmission', 'POST',
          'id=' + id + '&moduleID=' + moduleID, function (result) {
            if (!result.error) {
              if (result.data.length > 0) {
                let data = result.data;
                let moduleForm = $('#moduleForm');
                let recordCount = (10 - data[2].record_count);
                moduleForm.find('#limit').val(recordCount)
                moduleForm.find('.modal-nav button').each(function(i) {
                  if (i !== 0) {
                    if (i > recordCount) {
                      $(this).addClass('disabled');
                    }
                  }
                });
              }
            }
          });
      }
    });
  }

  function createForm(result, moduleID)
  {
    let data = result.data;
    let moduleDetails = data[1];
    let recordCount = data[2].record_count;
    let ctr = (10 - recordCount)

    let modal = $('.addEntry-modal');
    let modalNav  = modal.find('.modal-nav');
    let modalBody = modal.find('.modal-body');
    modalBody.empty();

    if (recordCount < 10) {
      //Alert all fields are filled-up!
    }

    let splitStartDate = moduleDetails.start.split('-');
    let splitEndDate   = moduleDetails.end.split('-');

    let sortedStartDate = splitStartDate[2] + '/' + splitStartDate[1] + '/' + splitStartDate[0];
    let sortedEndDate = splitEndDate[2] + '/' + splitEndDate[1] + '/' + splitEndDate[0];

    let modalNavContent = '';
    let modalBodyContent =
      '<div class="container">' +
      '<div class="row">' +
      '<div class="col-md-12">' +
      '<div class="modal-title text-center theme-text">' +
      '<h1 tabindex="-1" id="moduleFormModalLabel">Module: ' + moduleDetails.name +'</h1>' +
      '<p>' + moduleDetails.type + '</p>' +
      '<p class="mb-md-5"><small>' + sortedStartDate  + ' - ' + sortedEndDate + '</small></p>' +
      '<input type="hidden" class="start-period" name="start-period" value="' + sortedStartDate + '">' +
      '<input type="hidden" class="end-period" name="end-period" value="' + sortedEndDate + '">' +
      '<input type="hidden" class="module-id" name="module-id" value="' + moduleID + '" id="module-id">' +
      '</div>' +
      '</div>';
    modalBodyContent += '<div class="col-md-12">';
    data[0].forEach(function (i) {
      let id   = i.id;
      let form = i.formType;
      let fields = i.fields;
      if (form === 'single') {
        modalBodyContent += fieldType(id, fields, form);
      } else {
        for (let limit = 1; limit < ctr; limit++) {
          modalBodyContent += fieldType(id, fields, form, limit);
        }
      }
    });
    modalBodyContent += '</div>';
    modalBodyContent +=
      '</div>' +
      '</div>';

    modalBody.append(modalBodyContent);
  }

  function fieldType(id, fields, form, pos)
  {
    let formType = 'multiple-form' , fieldItem = '';
    if (form === 'single') formType = 'single-form active';
    fieldItem += '<div class="form-container module-form ' + formType + '">';
    fields.forEach(function (field) {
      let extraFields = field.extras;
      let marginBottom = 'mb-4';
      if (field.type === 'Separator') marginBottom = '';
      fieldItem += '<div class="form-group row ' + marginBottom + '" data-type="' + field.type + '">';
      if (field.type !== 'Title' && field.type !== 'Text' && field.type !== 'Separator') {
        fieldItem += '<label class="form-label col-sm-12 mb-md-3">' + field.label + '</label>';
      }
      fieldItem += '<div class="col-md-12">';
      if (field.type === 'Title') {
        fieldItem += '<div class="form-title"><span>' + field.name + '</span></div>';
      }
      if (field.type === 'Text') {
        fieldItem += '<div class="form-freetext">' + field.content + '</div>';
      }
      if (field.type === 'Separator') {
        fieldItem += '<hr>';
      }
      if (field.type === 'Textbox') {
        fieldItem += '<input type="text" class="form-control"><div class="invalid-feedback">Please provide a valid input.</div>';
      }
      if (field.type === 'UserAccount') {
        let user = $('.profile--name span').text();
        fieldItem += '<input type="text" class="form-control" value="' + user + '" disabled>';
      }
      if (field.type === 'Date') {
        fieldItem += '<input type="text" class="form-control" name="singledatepicker"><div class="invalid-feedback">Please provide a valid input.</div>';
      }
      if (field.type === 'RadioButton') {
        fieldItem += '<div class="radio-selector" tabindex="-1">';
        if (extraFields) {
          extraFields.forEach(function(item) {
            fieldItem +=
              '<div class="radio-item">' +
              '<input type="radio" name="' + field.id + '' + pos + '-mcs" value="' + item.name + '" class="styled-radio" id="radio-' + item.id + '' + pos +'">' +
              '<label for="radio-' + item.id + '' + pos + '" class="styled-radio--label">' +
              '<span><svg width="12px" height="9px" viewbox="0 0 12 9"><polyline points="1 5 4 8 11 1"></polyline></svg></span>' +
              '<span>'+ item.name +'</span>' +
              '</label>' +
              '</div>';
          });
        }
        fieldItem += '</div>';
      }
      if (field.type === 'Dropdown') {
        fieldItem += '<div class="dropdown-selector">';

      }

      fieldItem += '</div>';
      fieldItem += '</div>';
    });
    fieldItem += '<div class="action-btn text-right mt-5">' +
      '<button class="btn btn-close mr-2" data-dismiss="modal" aria-label="Close"><span class="">Close</span></button>' +
      '<button class="btn btn-primary btn-modal btn-next" data-type="next"><span class="mr-3">Next</span><i class="fad fa-long-arrow-right fa-lg"></i></button>' +
      '</div>';
    fieldItem += '</div>';
    return fieldItem;
  }

  function datePickerSettings()
  {
    let datePickerField = $('input[name="singledatepicker"]');
    if (datePickerField.length > 0) {
      datePickerField.daterangepicker({
        singleDatePicker: true,
        locale: {
          format: 'DD/MM/YYYY'
        }
      });
    }
  }

  function moduleForm()
  {
    let moduleForm = $('#moduleForm');
    if (moduleForm.length > 0) {
      let modalHeaderNav  = $('.modal-nav');
      let modalFormSubmit = $('#alert-modal');

      modalHeaderNav.find('button').click(function() {
        if ($(this).hasClass('finished')) {
          let id = $(this).data('id');
          $(this).siblings('button').removeClass('active');
          $(this).addClass('active');
          moduleForm.find('.module-form').each(function (i) {
            $(this).removeClass('active');
            if (id === 'start' && i === 0) {
              $(this).addClass('active');
            }
            if (id === i) {
              $(this).addClass('active');
            }
          });
        }
      });

      moduleForm.find('.action-btn .btn-modal').click(function (){
        let parentElement = $(this).parent('.action-btn').parent('.module-form.active');
        let btnType = $(this).attr('data-type');
        if (btnType === 'next' || btnType === 'submit-ready') {
          if (validateModuleFormFields()) {
            if (btnType === 'next') {
              let nextElement = parentElement.addClass('finished').removeClass('active').next();
              nextElement.addClass('active');
              //modalHeaderNav
              modalHeaderNav.find('button.active').removeClass('active').addClass('finished').next().addClass('active');
              $('.modal-title h1').focus();
            } else {
              //submission modal
              modalFormSubmit.modal('show');
            }
          }
        }

        if (btnType === 'back') {
          parentElement.removeClass('active').prev().addClass('active');
          modalHeaderNav.find('button.active').removeClass('active').prev().addClass('active');
        }
      });

      modalFormSubmit.find('.action-btn .btn-modal').click(function (){
        let btnType = $(this).attr('data-type');
        if (btnType === 'submit') {
          modalFormSubmit.find('button').addClass('disabled').attr("disabled", true);
          modalFormSubmit.find('.modal-body').append('' +
            '<div class="text-center">\n' +
            '  <div class="spinner-border text-primary" role="status">\n' +
            '    <span class="sr-only">Loading...</span>\n' +
            '  </div>\n' +
            '</div>')
          setTimeout(function () {
            moduleFormSubmission();
          },1000)
        }
      });

      //Ethnicity
      moduleForm.find('.module-form').each(function () {
        let dropdown = $(this).find('.dropdown-ethnicity');
        dropdown.on('show.bs.dropdown', function () {
          $('.dropdown-menu', this).find('.dropdown-item').click(function() {
            let selector = $(this).find('span');
            dropdown.find('.dropdown-toggle span').text(selector.text()).attr('data-id', selector.data('id'));
          });
        });
      });
    }
  }

  function validateModuleFormFields()
  {
    let isValid = true;
    $('.module-form.active').find('.form-group').each(function () {
      let formField = $(this);
      let fieldType = formField.data('type');
      if (fieldType === 'Date') {
        if (!dateValidator(formField, fieldType)) {
          isValid = false;
        }
      } else {
        if(!validateFields(formField, fieldType)) {
          isValid = false;
        }
      }
    });
    return isValid;
  }

  function validateFields(formField, fieldType)
  {
    let isValid = true;
    if (fieldType === 'UserAccount' || fieldType === 'Textbox') {
      let field = formField.find('.form-control');
      if (!field.val()) {
        field.addClass('is-invalid error-shake').focus();
        setTimeout(function () {
          field.removeClass('error-shake');
        },1000);
        isValid = false;
      }
    }

    if (fieldType === 'RadioButton') {
      let selector = formField.find('.radio-selector');
      let radioFields = selector.find('input[type="radio"]:checked');
      if (radioFields.length < 1) {
        selector.addClass('has-error error-shake').focus();
        setTimeout(function () {
          selector.removeClass('error-shake');
        },1000);
        isValid = false;
      } else {
        selector.removeClass('has-error');
      }
    }

    if (fieldType === 'Checkbox') {
      let selector = formField.find('.checkbox-selector');
      let checkboxFields = selector.find('input[type="checkbox"]:checked');
      if (checkboxFields.length < 1) {
        selector.addClass('has-error error-shake').focus();
        setTimeout(function () {
          selector.removeClass('error-shake');
        }, 1000);
        isValid = false;
      } else {
        selector.removeClass('has-error');
      }
    }

    if (fieldType === 'MultipleTextbox') {
      let greaterNum = [];
      let multiTextbox = formField.find('.multiple-textbox .textbox-item');
      if (multiTextbox.attr('data-type') === 'compare') {
        multiTextbox.each(function () {
          let formElement = $(this);
          let field = formElement.find('.form-control');
          if (!field.val()) {
            field.addClass('is-invalid error-shake').focus();
            field.next('.invalid-feedback').text('Please provide a valid input.');
            setTimeout(function () {
              field.removeClass('error-shake');
            },1000);
            isValid = false;
          } else {
            if (field.attr('data-type') === 'isGreaterThan') {
              greaterNum.push(field.val());
            } else {
              if (parseInt(field.val()) > parseInt(greaterNum[0])) {
                field.addClass('is-invalid error-shake').focus();
                field.next('.invalid-feedback').text('Input number should be less than '+ greaterNum[0]);
                setTimeout(function () {
                  field.removeClass('error-shake');
                },1000);
                isValid = false;
              }
            }
          }
        });
      } else {
        multiTextbox.each(function () {
          let formElement = $(this);
          let field = formElement.find('.form-control');
          if (!field.val()) {
            field.addClass('is-invalid error-shake').focus();
            setTimeout(function () {
              field.removeClass('error-shake');
            },1000);
            isValid = false;
          }
        });
      }
    }
    return isValid;
  }

  function dateValidator(formField, fieldType)
  {
    let isValid = true;
    if (fieldType === 'Date') {
      let field = formField.find('.form-control');
      let dateValParts = field.val().split("/");
      let dateVal = new Date(+dateValParts[2], dateValParts[1] - 1, 1);
      let startDateParts  = $('.start-period').val().split("/");
      let periodStartDate = new Date(+startDateParts[2], startDateParts[1] - 1, +startDateParts[0]);
      let endDateParts  = $('.end-period').val().split("/");
      let periodEndDate = new Date(+endDateParts[2], endDateParts[1] - 1, +endDateParts[0]);

      if (dateVal < periodStartDate || dateVal > periodEndDate) {
        field.addClass('is-invalid error-shake').focus();
        field.next('.invalid-feedback').text('Selected dispensing date is out of range with your current module period.');
        setTimeout(function () {
          field.removeClass('error-shake');
        }, 1000);
        isValid = false;
      } else {
        let month = dateValParts[1];
        let moduleID = $('#module-id').val();
        if (getFormFirstMonth.length < 1) {   //Check date exist in member's submission
          callAPIEndpoint('ajax/checkModuleFormDateExist', 'POST', 'moduleID=' + moduleID + '&month=' + month, function (result) {
            if (result.error !== true) {
              getFormFirstMonth.push(month);
            } else {
              field.addClass('is-invalid error-shake').focus();
              field.next('.invalid-feedback').text(result.message);
              setTimeout(function () {
                field.removeClass('error-shake');
              }, 1000);
              isValid = false;
            }
          });
        } else {
          console.log(month);
          console.log(getFormFirstMonth[0]);
          if (getFormFirstMonth[0] !== month) {  // Check form selected dispensing date ("Month") is the same as other forms.
            field.addClass('is-invalid error-shake').focus();
            field.next('.invalid-feedback').text('Selected dispensing date "month" should be the same with other forms dispensing date.');
            setTimeout(function () {
              field.removeClass('error-shake');
            },1000);
            isValid = false;
          }
        }
      }
      return isValid;
    }
  }

  function removeFieldError()
  {
    let moduleForm = $('#moduleForm');
    if (moduleForm.length > 0) {
      let checkbox    = $('.styled-checkbox');
      let radio       = $('.styled-radio');
      let inputText   = $('input[type="text"].form-control');
      let inputNumber = $('input[type="number"].form-control');
      let singleDate  = $('input[name="singledatepicker"].form-control');
      let textArea    = $('.form-textarea');

      //checkbox
      if (checkbox) {
        checkbox.click(function () {
          $(this).parent('.checkbox-item').parent('.checkbox-selector').removeClass('has-error');
        });
      }

      //radio
      if (radio) {
        radio.click(function () {
          $(this).parent('.radio-item').parent('.radio-selector').removeClass('has-error');
        });
      }

      //textfield
      if (inputText) {
        inputText.keydown(function () {
          $(this).removeClass('is-invalid');
        });
      }

      //textfield number
      if (inputNumber) {
        inputNumber.keydown(function () {
          $(this).removeClass('is-invalid');
        });
      }

      //date
      if (singleDate) {
        singleDate.change(function () {
          $(this).removeClass('is-invalid');
        });
      }

      //textarea
      if (textArea) {
        textArea.keydown(function () {
          $(this).removeClass('is-invalid');
        });
      }
    }
  }

  function moduleFormSubmission()
  {
    let formModuleID = $('#module-id').val();
    let pho = $('.pho').val();
    let practiceID = $('.practiceID').val();
    let moduleForms  = $('.module-form');
    let hasOneFormValueStorage = [];

    moduleForms.each(function(i) {
      let hasManyFormValueStorage = [];
      let form = $(this);
      if (form.hasClass('finished') || form.hasClass('active')) {
        let FormFields = form.find('.form-group');
        FormFields.each(function () {
          let field = $(this);
          let fieldType    = field.attr('data-type');
          let fieldLabel   = field.find('.form-label').text();
          let fieldLabelID = field.find('.form-label').data('id');

          /*
            User account, Textbox, Textarea & Date
           */
          if (fieldType === 'UserAccount' || fieldType === 'Textbox' || fieldType === 'Date' || fieldType === 'Textarea') {
            let fieldValue = field.find('.form-control');
            if (form.hasClass('single-form')) {
              hasOneFormValueStorage.push(fieldValue.val());
            }
            if(form.hasClass('multiple-form')) {
              hasManyFormValueStorage.push([fieldLabelID, fieldLabel, fieldValue.val()]);
            }
          }

          /*
            Ethnicity & Dropdown
          */
          if (fieldType === 'Ethnicity' || fieldType === 'Dropdown') {
            let fieldValue = field.find('.dropdown-selector .dropdown-toggle span');
            if (form.hasClass('single-form')) {
              hasOneFormValueStorage.push(fieldValue.text());
            }
            if (form.hasClass('multiple-form')) {
              hasManyFormValueStorage.push([fieldLabelID, fieldLabel, fieldValue.text()]);
            }
          }

          /*
            Radio Button
          */
          if (fieldType === 'RadioButton') {
            let radioItems = field.find('.radio-selector .radio-item');
            radioItems.each(function() {
              let fieldValue = $(this).find('input[type="radio"]:checked').val();
              if (fieldValue) {
                if (form.hasClass('single-form')) {
                  hasOneFormValueStorage.push(fieldValue.text());
                }
                if (form.hasClass('multiple-form')) {
                  hasManyFormValueStorage.push([fieldLabelID, fieldLabel, fieldValue]);
                }
              }
            });
          }

          /*
            Checkbox
          */
          if (fieldType === 'CheckBox') {
            let checkboxItems = field.find('.checkbox-selector .checkbox-item');
            checkboxItems.each(function() {
              let fieldValue = $(this).find('input[type="checkbox"]:checked').val();
              if (fieldValue) {
                if (form.hasClass('single-form')) {
                  hasOneFormValueStorage.push(fieldValue.text());
                }
                if (form.hasClass('multiple-form')) {
                  hasManyFormValueStorage.push([fieldLabelID, fieldLabel, fieldValue]);
                }
              }
            });
          }

          /*
            Multiple Textbox
          */
          if (fieldType === 'MultipleTextbox') {
            let textboxItem  = field.find('.multiple-textbox');
            let textboxArray = [];
            textboxItem.find('.textbox-item').each(function () {
              let textboxLabel = $(this).find('label').text();
              let textboxVal   = $(this).find('.form-control');
              textboxArray.push([textboxLabel, textboxVal.val()]);
            });
            if (form.hasClass('multiple-form')) {
              hasManyFormValueStorage.push([fieldLabelID, fieldLabel, textboxArray]);
            }
          }
        });

        hasOneFormFieldValueObj = hasOneFormValueStorage;
        if (form.hasClass('multiple-form')) {
          hasManyFormFieldValueObj[i] = hasManyFormValueStorage;
        }
      }
    });

    let strHasOneFormVal  = JSON.stringify(hasOneFormFieldValueObj);
    let strHasManyFormVal = JSON.stringify(hasManyFormFieldValueObj);

    callAPIEndpoint('ajax/submitModuleForm','POST',
      'formModuleID=' + formModuleID +
      '&practiceID=' + practiceID +
      '&pho=' + pho +
      '&hasOneFormValues=' + encodeURIComponent(strHasOneFormVal) +
      '&hasManyFormValues=' + encodeURIComponent(strHasManyFormVal), function (result) {
        console.log(result);
        if (!result.error) {
          setTimeout(function (){
            location.reload();
          },100);
        } else {
          console.log('Error caught on Form Submission: ' + result.error);
        }
      });
  }

  function dropdownPeriodSelector()
  {
    let periodSelector = $('.period-selector');
    if (periodSelector.length > 0) {
      periodSelector.on('show.bs.dropdown', function () {
        let ctr = 0;
        $('.dropdown-menu', this).find('.dropdown-item').click(function() {
          if (ctr <= 0) {
            let selector = $(this).find('span');
            periodSelector.find('.dropdown-toggle span').text(selector.text()).attr('data-id', selector.attr('data-id')).attr('data-period-id', selector.attr('data-period-id'));
            //Change Dashboard Period
            let periodRange = $('.datepicker-range');
            let startDate = selector.attr('data-period-start');
            let endDate   = selector.attr('data-period-end');
            periodRange.val(startDate + ' - ' + endDate);
            callAPIEndpoint('ajax/populateDashboardByPeriod', 'POST',
              'id=' + selector.attr('data-id') +
              '&periodID=' + selector.attr('data-period-id'), function (result) {
                console.log(result);
                setDropdownModuleSelector(result);
              });
          }
          ctr = ctr + 1;
        });
      });
    }
  }

  function setDropdownModuleSelector(result)
  {
    let data = result.data;
    let moduleSelector = $('.module-selector');
    let dropdownToggle = moduleSelector.find('.dropdown-toggle');
    let dropdownMenu   = moduleSelector.find('.dropdown-menu');
    let firstMenuItem  = dropdownMenu.find('.dropdown-item').first();
    let lastMenuItem   = dropdownMenu.find('.dropdown-item').last();

    dropdownToggle.find('span').text(data.clinicalmodule).attr({'data-id': data.clinicalmoduleid, 'data-moduletype-id': 1});
    dropdownToggle.find('i').attr('class', data.clinicalmoduleIcon);
    firstMenuItem.find('span').text(data.clinicalmodule).attr({'data-id': data.clinicalmoduleid, 'data-moduletype-id' : 1});
    firstMenuItem.find('i').attr('class', data.clinicalmoduleIcon);
    if (data.prescribingindicator) {
      lastMenuItem.find('span').text(data.prescribingindicator).attr({'data-id': data.prescribingindicatorid, 'data-moduletype-id': 2});
      lastMenuItem.find('i').attr('class', data.prescribingindicatorIcon);
    }

    let dashboard = $('.dashboard-section');
    let dashboardItem = '';

    callAPIEndpoint('ajax/populateDashboard', 'POST',
      'moduleTypeID=1'+
      '&moduleID=' + data.clinicalmoduleid , function (result) {
        console.log(result);
        if (!result.error) {
          if (result.data.length > 0) {
            setDashboardItem(result);
          } else {
            dashboard.empty();
            dashboardItem += '<div class="col-md-12 pb-3 pt-3 dashboard-section--item"><h5 class="text-center">No data has been found!</h5></div>';
            dashboard.append(dashboardItem);
          }
        } else {
          dashboard.empty();
        }
      });
  }

  function dropdownModuleSelector()
  {
    let dashboardHeader = $('.dashboard-header');
    if (dashboardHeader.length > 0) {
      let dropdown = $('.module-selector');
      dropdown.on('show.bs.dropdown', function () {
        let ctr = 0;
        $('.dropdown-menu', this).find('.dropdown-item').click(function(i) {
          if (ctr <= 0) {
            let selectedModule = $(this);
            let selectedModuleSpan = selectedModule.find('span');
            let dropdownBtn = dropdown.find('.dropdown-toggle');
            let moduleID    = selectedModuleSpan.attr('data-id');
            let moduleTypeID= selectedModuleSpan.attr('data-moduletype-id');
            dropdownBtn.find('span').text(selectedModuleSpan.text()).attr({'data-id': moduleID, 'data-moduletype-id': moduleTypeID});
            dropdownBtn.find('i').attr('class', selectedModule.find('i').attr('class'));
            callAPIEndpoint('ajax/populateDashboard', 'POST',
              'moduleTypeID=' + moduleTypeID +
              '&moduleID=' + moduleID , function (result) {
                console.log(result);
                if (!result.error) {
                  if (result.data.length > 0) {
                    setDashboardItem(result);
                  } else {
                    console.log('Alert: No data found!');
                  }
                }
              });
          }
          ctr = ctr + 1;
        });
      });
    }
  }

  function setDashboardItem(result)
  {
    let dashboard     = $('.dashboard-section'); //if dashboard exist in Page
    let dashboardItem = '';
    let data = result.data;
    dashboard.empty();
    if (dashboard.length > 0) {
      data.forEach(function (i) {
        dashboardItem +=
          '<div class="col-md-6 pb-3 pt-3 dashboard-section--item" data-title="' + i.name + '" data-id="' + i.id + '">' +
          '<div class="card">' +
          '<div class="card-header">' +
          '<div class="card-title">' + i.name + '</div>' +
          '</div>' +
          '<div class="body">' +
          '<div class="chart-container" id="chart-id'+i.id+'"></div>' +
          '</div>' +
          '</div>' +
          '</div>';
      });
      dashboard.append(dashboardItem);
      setTimeout(function () {
        populateDashboardWhenPageLoads();
      },100);
    }
  }

  function populateDashboardWhenPageLoads()
  {
    let moduleSelector = $('.module-selector #module-items span');
    let moduleID     = moduleSelector.attr('data-id');
    let moduleTypeID = moduleSelector.attr('data-moduletype-id');
    let dashboard = $('.dashboard-section'); //if dashboard exist in Page
    if (dashboard.length > 0) {
      dashboard.find('.dashboard-section--item').each(function() {
        let dashboardItemId = $(this).attr('data-id');
        callAPIEndpoint('ajax/populateDashboardItem','POST',
          'dashboardItemId=' + dashboardItemId +
          '&moduleTypeID=' + moduleTypeID +
          '&moduleID=' + moduleID , function (result) {
            if (!result.error) {
              if (result.data.length) {
                setTimeout(function () {
                  populateChart(dashboardItemId, result.data);
                },100);
              }
            } else {
              console.log('Error caught: ' + result.error);
            }
          });
      });
    }
  }

  function dateConverter(date)
  {
    let dateParts  = date.split("/");
    return new Date(+dateParts[2], dateParts[1] - 1, +dateParts[0]);
  }

  function populateChart(id, output)
  {
    let data = output;
    let arrayObj = {}, sortedResponses = [];
    let userType = $('.profile .profile--name').data('user-type');

    data.forEach(function (item) {
      let dataArray = item[0], moduleType = item[1];
      let dateObject = Object.keys(dataArray);
      let ordered = {};

      dateObject.sort(function(a, b) {
        return (dateConverter(a) - dateConverter(b));
      }).forEach(function(key) {
        ordered[key] = dataArray[key];
      });

      let dates = Object.keys(ordered);
      dates.forEach(function (i) {
        let responses = ordered[i];
        if (userType === 'General Practice') {
          if (moduleType === 'Clinical Module') {
            let count = {};
            if (responses.includes('N/A') || responses.includes('Yes')) {
              responses.forEach(function (i) {
                if (i !== 'No') {
                  count['Yes&N/A'] = (count['Yes&N/A']||0) + 10;
                } else {
                  count[i] = (count[i]||0) + 10;
                }
              });
              if (!responses.includes('No')) {
                count['No'] = 0;
              }
            } else {
              count['Yes&N/A'] = 0;
              if (responses.includes('No')) {
                responses.forEach(function (i) {
                  count[i] = (count[i]||0) + 10;
                });
              } else {
                count['No'] = 0;
              }
            }
            arrayObj[i] = count;
          } else { //Prescribing Indicator
            arrayObj[i] = responses[0];
          }
        } else { // Pharmacy
          if (moduleType === 'Clinical Module') {
            let count = {};
            if (responses.includes('N/A') || responses.includes('No')) {
              responses.forEach(function(i) {
                if (i !== 'Yes') {
                  count['No'] = (count['No']||0) + 10;
                } else {
                  count[i] = (count[i]||0) + 10;
                }
              });
              if (!responses.includes('Yes')) {
                count['Yes'] = 0;
              }
            } else {
              count['No'] = 0;
              if (responses.include('Yes')) {
                responses.forEach(function (i) {
                  count[i] = (count[i]||0) + 10;
                });
              } else {
                count['Yes'] = 0;
              }
            }
            arrayObj[i] = count;
          } else { //Prescribing Indicator
            arrayObj[i] = responses[0];
          }
        }
      });

      for(const [key, value] of Object.entries(arrayObj)) {
        let sortedDateIndex = dates.indexOf(key);
        sortedResponses[sortedDateIndex] = value;
      }

      if (sortedResponses.length) {
        generateChart(id, dates, sortedResponses, moduleType);
      }
    });
  }

  function generateChart(id, dates, responses, type)
  {
    let result = {};
    let data = [];

    for (let i = 0; i < responses.length; i++) {
      let obj = responses[i];
      for (let key in obj) {
        if (obj.hasOwnProperty(key)) {
          if (result[key]) {
            result[key].push(obj[key]);
          } else {
            result[key] = [obj[key]];
          }
        }
      }
    }

    let ctr = 0;
    let formatter, max, getHighestNum = 20;
    let names = Object.keys(result);
    names.forEach(function (i) {
      if (ctr === 0) {
        getHighestNum = Math.max.apply(null, result[i]);
      }

      if (type === 'Clinical Module') {
        if (i === 'No') {
          data[1] = {'name': i, 'data': result[i]};
        } else {
          data[0] = {'name': i, 'data': result[i]};
        }
      } else {
        data.push({'name': i, 'data': result[i]});
      }
      ctr = ctr + 1;
    });

    if (type === 'Clinical Module') {
      max = 100;
      formatter = '%';
    } else {
      max = getHighestNum;
      formatter = '';
    }

    let options = {
      chart: {
        type: 'line'
      },
      stroke: {
        curve: 'smooth',
      },
      markers: {
        size: 3,
      },
      series:
      data,
      xaxis: {
        categories: dates,
        type: "category",
      },
      yaxis: {
        min: 0,
        max: max,
        type: 'numeric',
        tickAmount: 5,
        labels: {
          formatter: (value) => value.toFixed(0) + formatter,
        },
      },
    }

    let chart = new ApexCharts(document.querySelector("#chart-id"+id), options);
    chart.render();
  }

  function adminDataTables()
  {
    let adminPage = $('.AdminPage');
    if (adminPage.length > 0) {
      let filters = $('.table-filters');
      let filterItem = filters.find('.filter-item');
      filterItem.on('show.bs.dropdown', function () {
        let thisDropdown = $(this);
        let dropdownType = thisDropdown.attr('data-type');
        let dropdownMenu = $('.dropdown-menu', this);
        let ctr = 0;
        dropdownMenu.find('.dropdown-item').click(function () {
          if (ctr <= 0) {
            let btnSpan = $(this).find('span');
            thisDropdown.find('.dropdown-toggle span').text(btnSpan.text()).attr('data-id', btnSpan.attr('data-id'));
            callAPIEndpoint('ajax/get' + dropdownType, 'POST', 'id=' + btnSpan.attr('data-id'), function (result) {
              console.log(result);
              if (!result.error) {
                let data = result.data;
                if (data.length > 0) {
                  if (dropdownType !== 'module') {
                    appendDropdown(filterItem, dropdownType, data);
                  } else {
                    generateAdminDataTables(data);
                  }
                }
              }
            });
          }
          ctr = ctr + 1;
        });
      });
    }
  }

  function appendDropdown(filterItem, dropdownType, data)
  {
    filterItem.each(function () {
      let dropdownFilter = $(this);
      if (dropdownType === 'memberType') {
        if (dropdownFilter.attr('data-type') === 'period') {
          dropdownItem(dropdownFilter, data);
        }
      }
      if (dropdownType === 'period') {
        if (dropdownFilter.attr('data-type') === 'module') {
          dropdownItem(dropdownFilter, data);
        }
      }
    });
  }

  function dropdownItem(dropdown, data)
  {
    let dropdownItem = '';
    data.forEach(function (i) {
      dropdownItem += '<a class="dropdown-item" role="button"><span data-id="'+ i.id +'">'+ i.name +'</span></a>';
    });
    dropdown.find('.dropdown-menu').empty().append(dropdownItem);
  }

  function generateAdminDataTables(data)
  {
    const mainHeader = [
      {'data' : 'Module', 'name' : 'Module'},
      {'data' : 'PracticeID', 'name' : 'PracticeID'},
      {'data' : 'PHO', 'name' : 'PHO'}
    ];

    let extraHeader = Object.values(data[1]);
    let setTableHeader = mainHeader.concat(extraHeader);
    let bodyContent = [], tableBody = data[0];
    let tableName = '#tableAdmin';
    let tableContainer = $('.table-container')
    /**
     * Reset DataTables
     */
    tableContainer.empty();
    tableContainer.append('<table id="tableAdmin" class="display nowrap" style="width: 100%;"><thead><tr></tr></thead><tbody><tr></tr></tbody></table>');

    tableBody.forEach(function (i) {
      let extraResponses = {};
      let responses = Object.values(i.responses);
      for (let index = 0; index < responses.length; index++) {
        if (index > 1) { //This excludes Dispensing Date[0] and Ethnicity[1]
          let responseKey = Object.keys(responses[index]);
          extraResponses[responseKey] = responses[index][responseKey];
        }
      }

      let mainResponses = {'Module': i.Module, 'PracticeID': i.PracticeID, 'PHO': i.PHO, 'Review_Date' : responses[0], 'Ethnicity' : responses[1] };
      bodyContent.push(Object.assign(mainResponses, extraResponses));
    });

    $.each(setTableHeader, function (k, colObj) {
      let str = '<th>' + colObj.name + '</th>';
      $(str).appendTo(tableName+'>thead>tr');
    });

    bodyContent.render = function (data, type, row) {
      return '<h4>' + data + '</h4>';
    }

    $(tableName).DataTable({
      "data": bodyContent,
      "columns": setTableHeader,
      dom: 'Bflrtip',
      buttons: [
        {
          extend : 'csv',
          text : '<i class="fal fa-arrow-circle-down"></i> <span class="ml-1">Export to CSV</span>',
        }
      ],
      "fnInitComplete": function () {
        // Event handler to be fired when rendering is complete (Turn off Loading gif for example)
        console.log('Datatable rendering complete');
      }
    });
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
