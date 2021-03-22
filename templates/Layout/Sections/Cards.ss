<% if $Content %>
    $Content
<% end_if %>
<% if $VisibleCardItems %>
    <div class="card-content mt-5">
        <div class="container-lg">
            <div class="row">
                <% loop $VisibleCardItems %>
                    <div class="$Width wow animate__animated $AnimationType">
                        <div class="card-item">
                            <% if $BgImage %>
                                <img src="$BgImage.URL" class="card-img" alt="$SiteConfig.Title - $Name">
                            <% end_if %>
                            <% if $Content %>
                                <div class="card-text">
                                    $Content
                                </div>
                            <% end_if %>
                        </div>
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
<% end_if %>
