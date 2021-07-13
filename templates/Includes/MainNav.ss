<div class="main-nav {$HeaderTheme}">
    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">
        <div class="container p-0">
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span class="h6 spacing-1 poppins font-weight-light text-uppercase">$MenuTitle.XML</span></a>
                            <% if $Children %>
                                <div class="dropdown-menu" role="menu" aria-hidden="true">
                                    <ul class="dropdown-items">
                                        <% loop $Children %>
                                            <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">
                                                <a class="dropdown-item" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
                                                    <div class="nav-bg-img" style="background-image: url('{$MenuBackground.URL}')"></div>
                                                    <% if $PageIcon %><img src="{$PageIconActive.URL}" class="menu-icon" alt="icon" data-active="$PageIconActive.URL" data-orig="$PageIcon.URL"><% end_if %><span class="h6 poppins font-weight-medium text-uppercase">$MenuTitle.XML</span>
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
