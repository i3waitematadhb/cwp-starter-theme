<div class="featuredNews-content">
    <div class="featuredNews-text">
        <% if $Content %>
            $Content
        <% end_if %>
    </div>
    <div class="featuredNews-image">
        <% if $Image %>
            <img src="$Image.URL" class="featuredNews-img" alt="$Title - $SiteConfig.Title">
        <% end_if %>
    </div>
 </div>
