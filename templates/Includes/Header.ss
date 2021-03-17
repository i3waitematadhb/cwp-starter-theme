<div class="container">
    <div class="row justify-content-between align-items-center">
        <div class="col-md-2">
            <div class="site-header clearfix">
                <% include SkipLinks %>
                <div class="site-header-brand">
                    <% if $SiteConfig.Logo %>
                        <a title="<%t CWP_Header.Title "Go to Home Page" %>" class="site-header-brand-link-default" href="$BaseHref">
                            <img src="$SiteConfig.Logo.URL" class="brand-image">
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

                <div class="navbar-expand-md navbar-light">
                    <button class="navbar-toggler float-right" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
                        <span class="sr-only"><%t CWP_Header.Toggle "Toggle navigation" %></span>
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>

                <% include HeaderSearch %>
                <% include LanguageSelector %>
            </div>
        </div>
        <div class="col-md-10">
            <% include MainNav %>
        </div>
    </div>
</div>
