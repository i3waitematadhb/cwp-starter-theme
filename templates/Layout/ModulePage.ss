<% if $CurrentUser %>
    <% include SidebarNav %>
    <div class="main-content">
        <div class="container p-0">
            <div class="row">
                <div class="col-md-12 dashboard-header">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-auto">
                            <h3 class="dashboard-title"><span class="theme-text">$Title</span></h3>
                        </div>
                        <div class="col-auto">
                            <button class="add-entry btn btn-success" data-toggle="modal" data-target="#moduleForm"><i class="fal fa-plus fa-sm mr-2"></i>New Record</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <table id="datatable" class="table hover" style="width:100%">
                            <thead>
                            <tr>
                                <th></th>
                                <th>ID</th>
                                <th>Account Name</th>
                                <th>Dispensing Date</th>
                                <th>Contact Person</th>
                                <th style="width: 45px;">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% if $ID == $CurrentUser.ClinicalModule.PageID %>
                                <% loop $PopulateTable($CurrentUser.ClinicalModule.ID) %>
                                <tr>
                                    <td></td>
                                    <td>$ID</td>
                                    <td>$Title</td>
                                    <td>$Date</td>
                                    <td>$Contact</td>
                                    <td><button class="tbl-action-btn" data-type="edit-row" data-module-id="$CurrentUser.ClinicalModule.ID" data-id="$ID" data-toggle="modal" data-target="#moduleForm"><i class="fad fa-file-plus"></i></button></td>
                                </tr>
                                <% end_loop %>
                            <% end_if %>
                            <% if $ID == $CurrentUser.PrescribingIndicator.PageID %>
                                <% loop $PopulateTable($CurrentUser.PrescribingIndicator.ID) %>
                                    <tr>
                                    <td></td>
                                    <td>$ID</td>
                                    <td>$Title</td>
                                    <td>$Date</td>
                                    <td>$Contact</td>
                                    <td><button class="tbl-action-btn" data-type="edit-row" data-module-id="$CurrentUser.PrescribingIndicator.ID" data-id="$ID" data-toggle="modal" data-target="#moduleForm"><i class="fad fa-file-plus"></i></button></td>
                                </tr>
                                <% end_loop %>
                            <%  end_if %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <% if $ID == $CurrentUser.ClinicalModule.PageID %>
            <div class="modal fade main-modal" id="moduleForm" tabindex="-1" role="dialog" aria-labelledby="moduleFormModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                        <div class="modal-nav">
                            <% if $CurrentUser.ClinicalModule.VisibleForms %>
                                <% loop $CurrentUser.ClinicalModule.VisibleForms %>
                                    <% if $FormType == 'single' %>
                                        <button class="active" data-id="start"><span><i class="far fa-plane-departure"></i></span></button>
                                    <% else %>
                                        <% loop $MultipleFormFields %>
                                            <button data-id="$Pos"><span>$Pos</span></button>
                                        <% end_loop %>
                                    <% end_if %>
                                <% end_loop %>
                            <% end_if %>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="modal-title text-center theme-text">
                                            <h1 tabindex="-1" id="moduleFormModalLabel">Module: $CurrentUser.ClinicalModule.Name</h1>
                                            <p>Clinical Module</p>
                                            <p class="mb-md-5"><small>{$CurrentUser.Period.StartDate.Format(dd/MM/Y)} - {$CurrentUser.Period.EndDate.Format(dd/MM/Y)}</small></p>
                                            <input type="hidden" class="start-period" name="start-period" value="{$CurrentUser.Period.StartDate.Format(dd/MM/Y)}">
                                            <input type="hidden" class="end-period" name="end-period" value="{$CurrentUser.Period.EndDate.Format(dd/MM/Y)}">
                                            <input type="hidden" class="module-id" name="module-id" value="$CurrentUser.ClinicalModule.ID" id="module-id">
                                            <input type="hidden" class="pho" name="pho" value="$CurrentUser.Pho">
                                            <input type="hidden" class="practiceID" name="practiceID" value="$CurrentUser.PracticeID">
                                            <input type="hidden" name="limit" value="" id="limit">
                                            <div class="form-alert alert alert-warning alert-dismissible fade" role="alert">
                                                <span class="alert-message"></span>
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <% loop $CurrentUser.ClinicalModule.VisibleForms %>
                                            <% if $FormType == 'single' %>
                                                <div class="form-container module-form single-form active">
                                                    <% loop $VisibleFields %>
                                                        <% include FieldType %>
                                                    <% end_loop %>
                                                    <div class="action-btn text-right mt-5">
                                                        <button class="btn btn-close mr-2" data-dismiss="modal" aria-label="Close"><span class="">Close</span></button>
                                                        <button class="btn btn-primary btn-modal btn-next" data-type="next"><span class="mr-3">Next</span><i class="fad fa-long-arrow-right fa-lg"></i></button>
                                                    </div>
                                                </div>
                                            <% else %>
                                                <% loop $MultipleFormFields %>
                                                    <div class="form-container module-form multiple-form">
                                                        <h4 class="form-heading">Patient $Pos</h4>
                                                        <% loop $VisibleFields %>
                                                            <% include FieldType Number=$Up.Pos %>
                                                        <% end_loop %>
                                                        <div class="action-btn text-right pt-4 pb-4 border-top">
                                                            <button class="btn btn-modal btn-back mr-2" data-type="back"><i class="fad fa-long-arrow-left fa-lg"></i><span class="ml-3">Back</span></button>
                                                            <% if not $Last %>
                                                                <button class="btn btn-primary btn-modal btn-next mr-5" data-type="next"><span class="mr-3">Next</span><i class="fad fa-long-arrow-right fa-lg"></i></button>
                                                            <% end_if %>
                                                            <button class="btn btn-success btn-modal btn-ready" data-type="submit-ready"><span class="mr-3">Submit</span><i class="fas fa-file-export"></i></button>
                                                        </div>
                                                    </div>
                                                <% end_loop %>
                                            <% end_if %>
                                        <% end_loop %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>
        <% if $ID == $CurrentUser.PrescribingIndicator.PageID %>
            <div class="modal fade main-modal" id="moduleForm" tabindex="-1" role="dialog" aria-labelledby="moduleFormModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true"><i class="fal fa-times"></i></span>
                        </button>
                        <div class="modal-nav">
                            <% if $CurrentUser.PrescribingIndicator.VisibleForms %>
                                <% loop $CurrentUser.PrescribingIndicator.VisibleForms %>
                                    <% if $FormType == 'single' %>
                                        <button class="active" data-id="start"><span><i class="fal fa-play"></i></span></button>
                                    <% else %>
                                        <% loop $MultipleFormFields %>
                                            <button data-id="$Pos"><span>$Pos</span></button>
                                        <% end_loop %>
                                    <% end_if %>
                                <% end_loop %>
                            <% end_if %>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="modal-title text-center theme-text">
                                            <h1 tabindex="-1" id="moduleFormModalLabel">Module: $CurrentUser.PrescribingIndicator.Name</h1>
                                            <p>Prescribing Indicator</p>
                                            <p class="mb-md-5"><small>{$CurrentUser.Period.StartDate.Format(dd/MM/Y)} - {$CurrentUser.Period.EndDate.Format(dd/MM/Y)}</small></p>
                                            <input type="hidden" class="start-period" name="start-period" value="{$CurrentUser.Period.StartDate.Format(dd/MM/Y)}">
                                            <input type="hidden" class="end-period" name="end-period" value="{$CurrentUser.Period.EndDate.Format(dd/MM/Y)}">
                                            <input type="hidden" class="module-id" name="module-id" value="$CurrentUser.PrescribingIndicator.ID" id="module-id">
                                            <input type="hidden" class="pho" name="pho" value="$CurrentUser.Pho">
                                            <input type="hidden" class="practiceID" name="practiceID" value="$CurrentUser.PracticeID">
                                            <input type="hidden" name="limit" value="" id="limit">
                                            <div class="form-alert alert alert-warning alert-dismissible fade" role="alert">
                                                <span class="alert-message"></span>
                                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                    <span aria-hidden="true"><i class="fal fa-times"></i></span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <% loop $CurrentUser.PrescribingIndicator.VisibleForms %>
                                            <% if $FormType == 'single' %>
                                                <div class="form-container module-form single-form active">
                                                    <% loop $VisibleFields %>
                                                        <% include FieldType %>
                                                    <% end_loop %>
                                                    <div class="action-btn text-right mt-5">
                                                        <button class="btn btn-close mr-2" data-dismiss="modal" aria-label="Close"><span class="">Close</span></button>
                                                        <button class="btn btn-primary btn-modal btn-next" data-type="next"><span class="mr-3">Next</span><i class="fad fa-long-arrow-right fa-lg"></i></button>
                                                    </div>
                                                </div>
                                            <% else %>
                                                <% loop $MultipleFormFields %>
                                                    <div class="form-container module-form multiple-form">
                                                        <% loop $VisibleFields %>
                                                            <% include FieldType Number=$Up.Pos %>
                                                        <% end_loop %>
                                                        <div class="action-btn text-right pt-4 pb-4 border-top">
                                                            <button class="btn btn-modal btn-back mr-2" data-type="back"><i class="fad fa-long-arrow-left fa-lg"></i><span class="ml-3">Back</span></button>
                                                            <% if not $Last %>
                                                                <button class="btn btn-primary btn-modal btn-next mr-5" data-type="next"><span class="mr-3">Next</span><i class="fad fa-long-arrow-right fa-lg"></i></button>
                                                            <% end_if %>
                                                            <button class="btn btn-success btn-modal btn-ready" data-type="submit-ready"><span class="mr-3">Submit</span><i class="fas fa-file-export"></i></button>
                                                        </div>
                                                    </div>
                                                <% end_loop %>
                                            <% end_if %>
                                        <% end_loop %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <% end_if %>
        <div class="modal fade addEntry-modal" id="addEntry-modal" tabindex="-1" role="dialog" aria-labelledby="addEntry" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                    <div class="modal-nav">
                    </div>
                    <div class="modal-body">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade alert-modal" id="alert-modal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header border-0">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                </div>
                <div class="modal-body p-5">
                    <h4 class="theme-text medium">Are you sure you want to submit this record?</h4>
                </div>
                <div class="modal-footer border-0">
                    <div class="action-btn">
                        <button type="button" class="btn btn-close mr-2" data-dismiss="modal"><span>Close</span></button>
                        <button class="btn btn-success btn-modal btn-submit" data-type="submit"><span class="mr-3">Submit</span><i class="fal fa-save fa-lg"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
 <% end_if %>
