<% if $TopBarNavigations %>
    <div class="quick-nav">
        <nav class="navbar navbar-expand-md navbar-light">
            <ul class="nav navbar-nav justify-content-between w-100" role="menubar">
                <% loop $TopBarNavigations %>
                    <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %> align-self-center">
                        <a href="$Page.Link" <% if $LinkingMode = current %>aria-label="current page"<% end_if %> class="nav-link $LinkingMode">$Title</a>
                    </li>
                <% end_loop %>
                <li role="menuitem" class="nav-item <% if $CurrentUser %>logout-btn<% else %>login-btn<% end_if %>">
                    <% if $CurrentUser %>
                        <div class="profile">
                            <a href="dashboard" class="profile--details">
                                <div class="profile--image"><% if $CurrentUser.ProfileImage %><img src="$CurrentUser.ProfileImage.URL"><% else %><img src="https://ui-avatars.com/api/?name={$CurrentUser.FirstName}+{$CurrentUser.LastName}&background=fff&color=004184&length=2&rounded=true"><% end_if %></div>
                                <div class="profile--name" data-id="{$CurrentUser.ID}" data-user-type="{$CurrentUser.MemberType.Name}"><span class="mr-2">$CurrentUser.FirstName<% if $CurrentUser.Surname %> $CurrentUser.Surname<% end_if %></span></div>
                            </a>
                            <a href="{$LogoutURL}&BackURL=login" class="log-out text-white"></span><i class="fad fa-sign-out"></i></a>
                        </div>
                    <% else %>
                        <a href="login" class="nav-link"><i class="far fa-user-lock"></i> <span>myDashboard Login</span></a>
                    <% end_if %>
                </li>
            </ul>
        </nav>
    </div>
<% end_if %>
<div class="main-nav">
    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN_NAVIGATION 'Main navigation' %>">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <div class="d-block d-md-none border-bottom border-top">
                    <form class="form-inline" action="/search/SearchForm">
                        <% include HeaderSearch ExtraClass="col-12 pt-2 pb-2" %>
                    </form>
                </div>
                <ul class="nav navbar-nav justify-content-between" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode">$MenuTitle.XML</a>

                            <% if $Children %>
                                <button class="btn btn-link float-right navbar-touch-caret" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">
                                    <span class="sr-only"><%t CWP_Theme.DISPLAY_SUBMENU_PAGES "Display {count} submenu pages" count=$MenuTitle.XML %></span>
                                    <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </button>

                                <ul class="dropdown-menu" role="menu" aria-hidden="true">
                                    <% loop $Children %>
                                        <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">
                                            <a class="dropdown-item" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
                                                $MenuTitle.XML
                                            </a>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        </li>
                    <% end_loop %>
                </ul>
            </div>
        </div>
    </nav>
</div>
