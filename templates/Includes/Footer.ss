<div class="container pt-4 pb-5">
    <div class="row justify-content-between">
        <% if $FooterVisibleItems %>
            <% loop $FooterVisibleItems %>
                <div class="col-md-auto col-sm-12">
                    <div class="footer-item">
                        <% if $ShowTitle %>
                            <h5 class="item-title">$Name</h5>
                        <% else %>
                            <h5 class="item-title">&nbsp;</h5>
                        <% end_if %>
                        <div class="footer-content">
                            <% if $ItemType == 'navigation' %>
                                <% if $VisibleLinkItems %>
                                    <ul>
                                        <% loop $VisibleLinkItems %>
                                            <li><a href="$Page.Link">$Title</a></li>
                                        <% end_loop %>
                                    </ul>
                                <% end_if %>
                            <% end_if %>
                            <% if $ItemType == 'code' %>
                                $EmbeddedCode.RAW
                            <% end_if %>
                            <% if $ItemType == 'logos' %>
                                <% if $LogoItems %>
                                    <% loop $LogoItems %>
                                        <% if $WebsiteURL %><a href="$WebsiteURL"><% end_if %>
                                        <img src="$LogoImage.URL" class="footer-image">
                                        <% if $WebsiteURL %></a><% end_if %>
                                    <% end_loop %>
                                <% end_if %>
                            <% end_if %>
                        </div>
                    </div>
                </div>
            <% end_loop %>
        <% end_if %>
    </div>
</div>
<div class="container-fluid bg-light-blue p-4">
    <div class="row justify-content-between">
        <div class="col-auto">
            <p>
                <small>Copyright &copy; $Now.year $SiteConfig.Title</small>
            </p>
        </div>
        <div class="col-auto">
            <a href="https://www.govt.nz/" class="footer-govt-logo">
                <img src="$resourceURL('themes/starter/images/newzealand-government-footer.png')"
                     width="210"
                     alt="<%t CWP_Footer.GovAlt 'newzealand.govt.nz - connecting you to New Zealand central &amp; local government services' %>"
                />
            </a>
        </div>
    </div>
</div>
