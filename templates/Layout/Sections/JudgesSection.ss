<div class="container-fluid p-0">
    <div class="row">
        <% if $Content %>
            <div class="col-lg-7 wow animate__animated animate__fadeInUp">
                $Content
            </div>
        <% end_if %>
        <% loop $VisibleJudgesBySelectedYear %>
            <div class="col-lg-12 mb-4 mt-4 mb-md-5 wow animate__animated animate__fadeInUp">
                <p class="display-5 font-weight-light">$Name</p>
                <% if $EventJudge %>
                    <div class="container-fluid mt-4 mb-5 mt-md-5">
                        <div class="row no-gutters">
                            <% loop $EventJudge %>
                                <div class="$Width<% if $even %> offset-lg-1<% end_if %>">
                                    <div class="judge-details">
                                    <% if $Image %>
                                        <div class="judge-image" style="background-image: url('{$Image.URL}')"><img src="$Image.URL" alt="$Name - WDHB Health Excellence Awards"></div>
                                    <% end_if %>
                                    <div class="judge-name-position"><p class="h2 font-weight-light spacing-1 lineheight-1">$Name</p><p class="font-weight-light spacing-1 lineheight-1">$Position</p></div>
                                    <% if $Blurb %>
                                        <button class="show-hide--btn"><span>Show more</span></button>
                                        <div class="judge-blurb"><p class="font-weight-light spacing-1">$Blurb</p></div>
                                    <% end_if %>
                                    <% if $Note %>
                                        $Note
                                    <% end_if %>
                                    </div>
                                </div>
                            <% end_loop %>
                        </div>
                    </div>
                <% end_if %>
            </div>
        <% end_loop %>
    </div>
</div>
