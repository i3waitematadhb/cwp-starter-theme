<div class="imageWithTextOverlay-content">
    <div class="imageWithTextOverlay-image">
        <% if $Image %>
            <img src="$Image.URL" class="" alt="$Title - $SiteConfig.Title">
        <% else %>
            <img src="{$resourceURL('themes/starter/images/BannerPlaceholderImage.jpg')}" class="" alt="$Title - $SiteConfig.Title">
        <% end_if %>
        <div class="imageWithTextOverlay-title"><p class="ff-clan display-3 text-dark font-weight-bold spacing-1">$Name</p></div>
        </div>
    <div class="imageWithTextOverlay-text"><% if $Content %>$Content<% end_if %></div>
</div>
