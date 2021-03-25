<% if $Image %>
    <img src="$Image.URL" class="banner-image" alt="$SiteConfig.Title - $Name">
<% end_if %>
<% if $Content %>
    <div class="banner-content">
        <div class="wow animate__animated animate__fadeInLeft">
            $Content
        </div>
    </div>
<% end_if %>
