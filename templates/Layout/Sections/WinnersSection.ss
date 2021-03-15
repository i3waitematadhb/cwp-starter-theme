<% if $Content %>
    $Content
<% end_if %>
<% if $VisibleEventWinners %>
    <% loop $VisibleEventWinners %>
        <button class="accordion-btn active"><span class="h4 font-weight-light lineheight-3 spacing-1">$Winners.Year</span> <i class="fal fa-chevron-down"></i></button>
        <div class="panel active">
            <div class="panel--content">
                <div class="container-fluid p-0">
                    <div class="row">
                        <% if $Winners.Categories %>
                            <% loop $Winners.Categories %>
                                <div class="col-lg-4 pb-4 pb-lg-5 pt-4 pt-lg-5">
                                    <p class="h2 pb-2" style="min-height: 100px;"><span class="lineheight-1 spacing-1 font-weight-light">$Name</span></p>
                                    <% loop $Winners %>
                                        <img src="$Image.URL" class="w-100 mb-4" alt="Waitemata Health Excellence Awards Finalist - {$Name}">
                                        $Content.RAW
                                    <% end_loop %>
                                </div>
                            <% end_loop %>
                        <% else %>
                            <div class="col-lg-12">
                                $Winners.YearContent.RAW
                            </div>
                        <% end_if %>
                    </div>
                </div>
            </div>
        </div>
    <% end_loop %>
<% end_if %>
