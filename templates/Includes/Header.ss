<div class="container site-header clearfix">
    <div class="row">
        <div class="col-lg-3 col-10">
            <% include SkipLinks %>
            <div class="site-header-brand">
                <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
                    <span>$SiteConfig.Title</span>
                </a>
                <% if $SiteConfig.Tagline %>
                    <span class="site-header-brand-tagline">$SiteConfig.Tagline</span>
                <% end_if %>
            </div>
            <div class="navbar-expand-md navbar-light">
                <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                    <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </div>
        <div class="col-lg-9">
            <% include MainNav %>
            <% include HeaderSearch %>
            <% include LanguageSelector %>
        </div>
    </div>


<%--    <div class="col-lg-9">--%>
<%--        <% include MainNav %>--%>
<%--        <button class="hamburger hamburger--squeeze" type="button">--%>
<%--            <span class="hamburger-box">--%>
<%--                <span class="hamburger-inner"></span>--%>
<%--            </span>--%>
<%--        </button>--%>
<%--    </div>--%>
</div>
