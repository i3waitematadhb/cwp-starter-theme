<% if $Image %>
    <img src="$Image.URL" class="banner-image" alt="$SiteConfig.Title - $Name">
<% end_if %>
<% if $Content %>
    <div class="banner-content">
        $Content
    </div>
<% end_if %>
