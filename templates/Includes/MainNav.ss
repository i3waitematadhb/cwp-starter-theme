<div class="main-nav {$HeaderTheme}">
    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">
        <div class="container p-0">
            <div class="collapse navbar-collapse" id="navbar-collapse">

                <ul class="nav navbar-nav" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span class="h6 spacing-1 poppins font-weight-normal text-uppercase">$MenuTitle.XML</span></a>
                            <% if $Children %>
                                <div class="dropdown-menu" role="menu" aria-hidden="true">
                                    <div class="parent-link"> $PageIcon
                                        <% if $PageMenuImage %>
                                        <div class="parent-link--img mb-3">
                                            <img src="$PageMenuImage.URL" alt="$MenuTitle.XML - $SiteConfig.Title">
                                        </div>
                                        <% end_if %>
                                        <a href="$Link"><span class="h5 spacing-1 poppins font-weight-semibold text-uppercase text-brand">$MenuTitle.XML</span></a>
                                        <% if $MenuContent %><p class="mt-2 mb-3"><span class="small font-weight-normal">$MenuContent</span></p><% end_if %>
                                        <p class="mb-0"><a href="$Link"><span class="btn-bg-gradient-sml h6 poppins font-weight-semibold mb-0">View More</span></a></p>
                                    </div>
                                    <ul class="dropdown-items">
                                        <% loop $Children %>
                                            <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">
                                                <a class="dropdown-item text-center" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
<%--                                                    <div class="nav-bg-img" style="background-image: url('{$MenuBackground.URL}')"></div>--%>
                                                    <% if $PageIcon %><img src="{$PageIcon.URL}" class="dropdown-item--icon d-block" alt="icon"><% end_if %><div class="dropdown-item--title"><span class="h6 small poppins font-weight-semibold">$MenuTitle.XML</span></div>
                                                <% if $MenuContent %>
                                                <div class="dropdown-item--menu-content">
                                                    <span class="small font-weight-normal text-dark">$MenuContent</span>
                                                </div>
                                                <% end_if %>
                                                </a>
                                            </li>
                                        <% end_loop %>
                                    </ul>
                                </div>
                            <% end_if %>
                        </li>
                    <% end_loop %>
                </ul>
                <div class="d-block search-form">$SearchForm</div>
            </div>
        </div>
    </nav>
</div>
