<% include  SidebarNav %>
<div class="main-content">
    <div class="container-fluid">
        <div class="row no-gutters">
            <div class="col-md-12 dashboard-header">
                <div class="container p-0">
                    <div class="row justify-content-between">
                        <div class="col-md-6">
                            <h3 class="dashboard-title"><span class="theme-text">Overview</span></h3>
                            <p class="medium theme-text-darkgrey">Welcome Back, {$CurrentUser.FirstName} {$CurrentUser.LastName}.</p>
                        </div>
                        <div class="col-md-3 text-right">
                            <div class="module-selector">

                                <div class="dropdown">
                                    <% if $CurrentUser.ClinicalModule %>
                                        <button class="btn dropdown-toggle" type="button" id="module-items" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="$CurrentUser.ClinicalModule.Icon"></i><span data-id="$CurrentUser.ClinicalModule.ID" data-moduletype-id="$CurrentUser.ClinicalModule.Type.ID">$CurrentUser.ClinicalModule.Title</span>
                                        </button>
                                    <% end_if %>
                                    <div class="dropdown-menu" aria-labelledby="module-items">
                                        <% if $CurrentUser.ClinicalModule %>
                                            <h6 class="dropdown-header pt-4 pb-2">Clinical Module</h6>
                                            <a class="dropdown-item" role="button"><i class="$CurrentUser.ClinicalModule.Icon"></i><span data-id="$CurrentUser.ClinicalModule.ID" data-moduletype-id="$CurrentUser.ClinicalModule.Type.ID">$CurrentUser.ClinicalModule.Title</span></a>
                                        <% end_if %>
                                        <% if $CurrentUser.PrescribingIndicator %>
                                            <h6 class="dropdown-header pt-4 pb-2">Prescribing Indicator</h6>
                                            <a class="dropdown-item" role="button"><i class="$CurrentUser.PrescribingIndicator.Icon"></i><span data-id="$CurrentUser.PrescribingIndicator.ID" data-moduletype-id="$CurrentUser.PrescribingIndicator.Type.ID">$CurrentUser.PrescribingIndicator.Title</span></a>
                                        <% end_if %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">

                            <div class="period-selector text-right">
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="ml-0" data-id="" data-period-id="">Select Period</span>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <% loop $CurrentUser.ModuleHistories %>
                                            <a class="dropdown-item" role="button" <% if $ClinicalModuleID %>data-cmid="{$ClinicalModuleID}"<% end_if %> <% if $PrescribingIndicatorID %>data-piid="{$PrescribingIndicatorID}"<% end_if %> ><span class="ml-0" data-id="{$ID}" data-period-id="{$PeriodID}" data-period-start="{$StartDate.Format(dd/MM/Y)}" data-period-end="{$EndDate.Format(dd/MM/Y)}">{$Name}</span></a>
                                        <% end_loop %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 dashboard-date">
                <div class="container p-0">
                    <div class="d-flex justify-content-between">
                        <% if $CurrentUser.Period %>
                            <div class="date">
                                <div class="date-container d-flex align-items-center"><label for="datepicker-range"><i class="fad fa-calendar-alt"></i></label><input type="text" name="dates" value="{$CurrentUser.Period.StartDate.Format(dd/MM/Y)} - {$CurrentUser.Period.EndDate.Format(dd/MM/Y)}" class="datepicker-range" id="datepicker-range" disabled></div>
                            </div>
                        <% end_if %>
                    </div>
                </div>
            </div>
            <div class="col-md-12 dashboard-body">
                <div class="container p-0">
                    <div class="row dashboard-section">
                        <% loop $ShowDashboard %>
                            <% if $VisibleFields %>
                                <% loop $VisibleFields %>
                                    <% if $ShowInDashboard %>
                                        <div class="col-md-6 pb-3 pt-3 dashboard-section--item" data-title="{$Title}" data-id="{$ID}">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="card-title">$Title</div>
                                                </div>
                                                <div class="card-body">
                                                    <div id="chart-id{$ID}" class="chart-container"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <% end_if %>
                                <% end_loop %>
                            <% end_if %>
                        <% end_loop %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


