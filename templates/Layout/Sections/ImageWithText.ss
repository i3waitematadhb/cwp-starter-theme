<div class="imageWithText-content d-md-flex">
    <div class="content-image wow animate__animated<% if $ContentPosition == 'position-left' %> order-last<% if not $GradientBackground %> animate__fadeInRight<% end_if %><% if $GradientBackground %> slide-left<% end_if %><% else %><% if $GradientBackground %> slide-right<% else %> animate__fadeInLeft<% end_if %><% end_if %>">
        <div class="content-image__wrapper">
            <% if $Image %>
                <img src="$Image.URL" class="<% if $GradientBackground %>withGradient<% end_if %>" alt="$Title - $SiteConfig.Title">
            <% else %>
                <img src="{$resourceURL('themes/starter/images/BannerPlaceholderImage.jpg')}" class="<% if $GradientBackground %>withGradient<% end_if %>" alt="$Title - $SiteConfig.Title">
            <% end_if %>
        </div>
    </div>
    <div class="content-text<% if $GradientBackground %> gradientBg<% end_if %> wow animate__animated<% if $ContentPosition == 'position-left' %> order-first<% if not $GradientBackground %> animate__fadeInLeft<% end_if %><% if $GradientBackground %> slide-right<% end_if %><% else %><% if $GradientBackground %> slide-left<% end_if %><% if not $GradientBackground %> animate__fadeInRight<% end_if %><% end_if %> d-flex align-items-center">
        <div class="content-text__wrapper<% if $GradientBackground %> wow animate__animated animate__fadeInUp delay-3s<% end_if %>">
            <% if $Content %>
                $Content
            <% end_if %>
        </div>
    </div>
</div>
