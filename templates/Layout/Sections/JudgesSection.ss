<div class="container-fluid p-0">
    <div class="row">
        <% loop $VisibleJudgesThisYear %>
            <div class="col-lg-12">
                <p class="display-5 font-weight-light">$Name</p>
                <% if $EventJudge %>
                    <div class="container-fluid">
                        <div class="row no-gutters">
                            <% loop $EventJudge %>
                                <div class="col-lg-4">
                                    <div class="judge-details">
                                    <% if $Image %>
                                        <div class="judge-image"><img src="$Image.URL" alt="$Name - WDHB Health Excellence Awards"> </div>
                                    <% end_if %>
                                    <div class="judge-name-position"><p>$Name</p><p>$Position</p></div>
                                    <div class="judge-blurb">$Blurb</div>
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
