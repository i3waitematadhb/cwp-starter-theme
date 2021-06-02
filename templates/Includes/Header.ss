<div class="container-fluid site-header clearfix {$SiteConfig.LogoPos}">
    <% include SkipLinks %>
    <div class="site-header-brand">
        <% if $SiteConfig.Logo %>
        <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
            <img src="$SiteConfig.Logo.URL" class="brand-logo" style="max-width: {$SiteConfig.LogoSize}px;" alt="Logo - $Title">
        </a>
        <% end_if %>

        <% if $SiteConfig.Tagline %>
            <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
        <% end_if %>
    </div>
     <button class="hamburger hamburger--collapse" type="button">
      <span class="hamburger-box">
        <span class="hamburger-inner"></span>
      </span>
    </button>
<%--    <div class="navbar-expand-md navbar-light">--%>
<%--        <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">--%>
<%--            <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--    </div>--%>

    <% include HeaderSearch %>
    <% include LanguageSelector %>
</div>
