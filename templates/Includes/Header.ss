<div class="container-fluid site-header clearfix p-0">
    <div class="row no-gutters justify-content-between">
        <div class="col-md-3 col-10">
            <% include SkipLinks %>
            <div class="site-header-brand">
                <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
                    <% if $SiteConfig.SiteLogo %>
                        <img src="$SiteConfig.SiteLogo.URL" class="site-logo" alt="$Title">
                    <% else %>
                        <span>$SiteConfig.Title</span>
                    <% end_if %>
                </a>
                <% if $SiteConfig.Tagline %>
                    <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
                <% end_if %>
            </div>
        </div>
        <div class="col-md-9 col-2">
            <% include MainNav %>
            <button class="hamburger hamburger--squeeze" type="button">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </button>
<%--            <div class="navbar-expand-md navbar-light">--%>
<%--                <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">--%>
<%--                    <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--            </div>--%>
            <% include HeaderSearch %>
            <% include LanguageSelector %>
        </div>
        <div class="col-lg-12 d-xl-none" id="mobile-nav">
            <% include MainNav %>
        </div>
    </div>
</div>
