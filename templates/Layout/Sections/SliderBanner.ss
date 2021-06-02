<div class="sliderBanner-content">
    <% if $VisibleSliderItems %>
        <div class="owl-carousel owl-theme">
            <% loop $VisibleSliderItems %>
                <div class="sliderContent-item">
                    <div class="slider-image<% if $ImageOverlay != 'none'%> overlay-{$ImageOverlay}<% end_if %>">
                        <% if $SliderImage %>
                            <img src="{$SliderImage.URL}" alt="$Title - $SiteConfig.Title">
                        <% else %>
                            <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title">
                        <% end_if %>
                    </div>
                    <% if $Content %>
                        <div class="slider-content {$ContentPosition}-content">
                            <div class="wow animate__animated animate__fadeInUp">
                                {$Content}
                            </div>
                        </div>
                    <% end_if %>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
