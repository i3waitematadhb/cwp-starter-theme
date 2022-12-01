<!doctype html>
<html class="no-js" lang="$ContentLocale">
    <head>
        <% base_tag %>
        <title><% if $MetaTitle %>$MetaTitle.XML<% else %>$Title.XML<% end_if %> | $SiteConfig.Title.XML</title>
        $MetaTags(false)
        <meta name="viewport" id="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=10.0,initial-scale=1.0" />
        <% if $RSSLink %>
        <link rel='alternate' type='application/rss+xml' title='RSS' href='$RSSLink'>
        <% end_if %>
        <% require themedCSS('dist/css/main.css') %>
        <% include Favicon %>
    </head>
    <body class="$ClassName" <% if $PageBackground %>style="background-image: url('{$PageBackground.URL}');background-size: 100vw;"<% end_if %>>
        <% include PageLoader %>
        <header role="banner">
            <% include Header %>
            <% include MainNav %>
            <div class="d-md-block d-lg-none">
            <button class="hamburger hamburger--collapse" type="button" data-open="">
                <span class="hamburger-box">
                    <span class="hamburger-inner"></span>
                </span>
            </button>
            </div>
        </header>
<%--        <% include Search %>--%>
<%--        <% include NewNav %>--%>
<%--        <% include Nav %>--%>
        <main id="main" class="main row no-gutters<% if $EnableFullPage %> fullpage-scroll<% end_if %>" role="main">
            $Layout
        </main>
        <% include PageShowcase %>
        <footer class="footer-site" role="contentinfo">
            <% include Footer %>
        </footer>
        <% require themedJavascript('dist/js/jquery.min.js') %>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/2542/jquery.scrollie.min_1.js"></script>
        <script type="text/javascript" src="https://unpkg.com/external-svg-loader@1.3.1/svg-loader.min.js" async></script>
        <% require themedJavascript('dist/js/main.js') %>
        <% include GoogleAnalytics %>
    </body>
</html>
