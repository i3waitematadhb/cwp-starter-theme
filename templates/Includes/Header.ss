<div class="container site-header clearfix position-relative">
    <% include SkipLinks %>
    <div class="site-header-brand">
        <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
            <% if $SiteConfig.Logo %>
            <img src="$SiteConfig.Logo.URL" alt="{$SiteConfig.Title} - Site logo" style="width:{$SiteConfig.LogoWidth}px">
            <% else %>
            <span>$SiteConfig.Title</span>
            <% end_if %>
        </a>
        <% if not $SiteConfig.Logo %>
            <% if $SiteConfig.Tagline %>
                <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
            <% end_if %>
        <% end_if %>
    </div>
    <% if $PreHeaderMenuItems %>
    <div class="preheader-menu">
        <ul class="d-flex justify-content-between align-items-center list-unstyled">
        <% loop $PreHeaderMenuItems %>
            <li><a href="$Page.Link"><span class="h5 font-spartan font-weight-semibold text-brand">$Title</span></a></li>
        <% end_loop %>
            <li class="preheader-btns"><button class="btn-search text-brand"><i class="fal fa-search"></i></button><button class="btn-login text-brand"><i class="fal fa-user-circle"></i></button></li>
        </ul>
    </div>
    <% end_if %>
    <div class="main-menu">
        <% include MainNav %>
    </div>

    <div class="navbar-expand-md navbar-light">
        <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
            <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>

    <div class="preheader-search">$SearchForm</div>
    <div class="preheader-login"><% include LoginForm %></div>

    <% include HeaderSearch %>
    <% include LanguageSelector %>
</div>

