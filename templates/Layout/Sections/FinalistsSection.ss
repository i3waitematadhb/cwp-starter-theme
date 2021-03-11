<% if $Content %>
    $Content
<% end_if %>

<% if $VisibleEventFinalists %>
    <% loop $VisibleEventFinalists %>
        <button class="accordion-btn active"><span class="h4 font-weight-light lineheight-3 spacing-1">$Finalists.Year</span> <i class="fal fa-chevron-down"></i></button>
        <div class="panel active">
            <div class="panel--content">
                <% if $Finalists.Year != "2021" %>
                <div class="container-fluid p-0">
                    <div class="row no-gutters">
                        <% if $Finalists.Categories %>
                        <% end_if %>
                        <% loop $Finalists.Categories %>
                            <div class="col-lg-12">
                                <p class="display-5 pb-2"><span class="lineheight-1 spacing-1 font-weight-light">$Name</span></p>
                                <% if $Content %>
                                    $Content.RAW
                                <% end_if %>
                                <% if $Finalists %>
                                    <div class="container-fluid pt-3 pb-3 pt-lg-5 pb-lg-5 pl-0 pr-0">
                                        <div class="row">
                                            <% loop $Finalists %>
                                                <div class="col-lg-4 pb-5">
                                                    <img src="$Image.URL" class="w-100 mb-4" alt="Waitemata Health Excellence Awards Finalist - {$Name}">
                                                    $Content.RAW
                                                </div>
                                            <% end_loop %>
                                        </div>
                                    </div>
                                <% end_if %>
                                <hr>
                            </div>
                        <% end_loop %>
                    </div>
                </div>
                <% else %>
                <p class="display-5 font-weight-light">Coming soon - Watch this space!</p>
                <% end_if %>
            </div>
        </div>
    <% end_loop %>
<% end_if %>
