<% if $Banner %><div class="image-banner--image<% if $BannerHeight %> $BannerHeight<% end_if %>" style="background-image: url('{$Banner.URL}');" data-height="<% if $BannerHeight == 'bh-large' %>100<% end_if %><% if $BannerHeight == 'bh-medium' %>80<% end_if %><% if $BannerHeight == 'bh-small' %>40<% end_if %>"></div><% end_if %>
<div class="image-banner--text {$ContentPosition}">$Content</div>
<% if $ShowScrollIcon %><% include MouseIconScroll %><% end_if %>
