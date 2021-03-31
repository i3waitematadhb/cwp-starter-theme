<% if $ImageOverlay != 'none'%>
    <div class="overlay-{$ImageOverlay}">
<% end_if %>
<% if $Image %>
    <img src="$Image.URL" alt="$Title - $SiteConfig.Title" class="$ImageHeight<% if $IsParallax %> parallax-image<% end_if %>">
<% else %>
    <img src="{$resourceURL('themes/starter/images/BannerPlaceholderImage.jpg')}" alt="$Title - $SiteConfig.Title" class="$ImageHeight">
<% end_if %>
<% if $ImageOverlay != 'none'%></div><% end_if %>
<% if $Content %>
    <div class="imageBanner-content {$ContentPosition}">
        $Content
    </div>
<% end_if %>
