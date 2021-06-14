<div class="container-fluid site-header clearfix {$SiteConfig.SiteLogoPosition} {$HeaderTheme}">
    <% include SkipLinks %>
    <div class="site-header-brand">
        <% if $SiteConfig.SiteLogo %>
            <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
<%--                <svg data-src="{$SiteConfig.SiteLogo.URL}" style="width: {$SiteConfig.SiteLogoWidth}px;"></svg>--%>
<%--                <object type="image/svg+xml" data="$SiteConfig.SiteLogo.URL" class="logo" ></object>--%>
                <img src="$SiteConfig.SiteLogo.URL" class="site-logo site-logo-main" alt="$Title" data-logo="$SiteConfig.AltSiteLogo.URL" style="width: {$SiteConfig.SiteLogoWidth}px;">
            </a>
        <% else %>
            <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
                <span>$SiteConfig.Title</span>
            </a>
            <% if $SiteConfig.Tagline %>
                <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
            <% end_if %>
        <% end_if %>
    </div>
<%--    <button class="hamburger hamburger--collapse" type="button" data-open="">--%>
<%--      <span class="hamburger-box">--%>
<%--        <span class="hamburger-inner"></span>--%>
<%--      </span>--%>
<%--    </button>--%>
</div>
