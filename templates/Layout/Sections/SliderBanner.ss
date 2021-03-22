<% if $VisibleSliderItems %>
    <div class="owl-carousel owl-theme">
        <% loop $VisibleSliderItems %>
            <div class="carousel-content">
                <% if $BannerImage %>
                    <img src="$BannerImage.URL" alt="$SiteConfig.Title - $Name">
                <% end_if %>
                <% if $Content %>
                    <div class="container">
                        <div class="carousel-text text-white">$Content</div>
                    </div>
                <% end_if %>
            </div>
        <% end_loop %>
    </div>
<% end_if %>


