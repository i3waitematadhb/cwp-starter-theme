<% if $Content %>
    $Content
<% end_if %>
<% if $VisibleEventFinalists %>
    <% loop $VisibleEventFinalists %>
        <button class="accordion-btn<% if $First %> active<% end_if %>"><span class="h4 font-weight-light lineheight-3 spacing-1">$Finalists.Year</span> <i class="fal fa-chevron-down"></i></button>
        <div class="panel<% if $First %> active<% end_if %>">
            <div class="panel--content">
                <div class="container-fluid p-0">
                    <div class="row no-gutters">
                        <% if $Finalists.Categories %>
                            <% loop $Finalists.Categories %>
                                <div class="col-lg-12">
                                    <p class="display-5 pb-2"><span class="lineheight-1 spacing-1 font-weight-light">$Name</span></p>
                                    <% if $Content %>
                                        $Content.RAW
                                    <% end_if %>
                                        <div class="container-fluid pt-3 pb-3 pt-lg-5 pb-lg-5 pl-0 pr-0">
                                            <div class="row">
                                                <% loop $Finalists %>
                                                    <div class="col-lg-4 pb-5">
                                                        <% if $Image %>
                                                            <img src="$Image.URL" class="w-100 mb-4" alt="Waitemata Health Excellence Awards Finalist - {$Name}">
                                                        <% end_if %>
                                                        $Content.RAW
                                                    </div>
                                                <% end_loop %>
                                            </div>
                                        </div>
                                    <hr>
                                </div>
                            <% end_loop %>
                        <% else %>
                            <div class="col-lg-12">
                                $Finalists.YearContent.RAW
                            </div>
                        <% end_if %>
                    </div>
                </div>
            </div>
        </div>
    <% end_loop %>
<% end_if %>
