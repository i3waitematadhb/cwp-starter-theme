<div class="slider-wrapper">
    <% if $VisibleSliderItems %>
    <div class="owl-carousel">
        <% loop $VisibleSliderItems %>
        <div class="slider-item">
            <img src="$SliderImage.URL" class="slider-img" alt="$Siteconfig.Title - $Title">
            <div class="slider-content {$ContentPos}-content container"><div class="content-text">$Content</div></div>
        </div>
        <% end_loop %>
    </div>
    <% end_if %>
</div>
