<div class="menu">
    <div class="menu-inner">
        <div class="menu-content">
            <div>
                <nav class="navigation">
                    <div class="navigation-content">
                        <div class="navigation-row">
                            <div class="navigation-primary">
                                <div class="navigation-scroll">
                                    <div>
                                        <div class="primaryNav">
                                            <ul class="primary-ul list-unstyled">
                                                <% loop Menu(1) %>
                                                    <li class="li-{$Pos} pt-4 pb-4"><span class="display-6 ff-clan font-weight-medium">$MenuTitle.XML</span><svg class="primaryNavItem__svg___1VE2h" width="9px" height="15px"><path fill="currentColor" fill-rule="evenodd" d="M7 9l-6 6-1-1 6-6-6-6 1-1 7 7-1 1z"></path></svg></li>
                                                <% end_loop %>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="footer-nav">
                                        <div class="socials"></div>
                                    </div>
                                </div>
                                <div class="navigation-backdrop"></div>
                            </div>
                            <div class="navigation-secondary">
                                <% loop Menu(1) %>
                                    <div class="panel__nav" data-toggle="dropdown-{$ID}">
                                        <div class="panel__3">
                                            <div class="panel__scroll">
                                                <div class="panel__content">
                                                    <div class="content__inner">
                                                        <% loop $Children %>
                                                            <div class="">$MenuTitle.XML</div>
                                                        <% end_loop %>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <% end_loop %>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>

<%--<div class="new-nav">--%>
<%--    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">--%>
<%--        <div class="container p-0">--%>
<%--            <div class="collapse navbar-collapse" id="navbar-collapse">--%>
<%--                <ul class="nav navbar-nav" role="menubar">--%>
<%--                    <% loop Menu(1) %>--%>
<%--                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">--%>
<%--                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span class="h6 assistant spacing-1 font-weight-medium">$MenuTitle.XML</span></a>--%>
<%--                            <% if $Children %>--%>
<%--                                <button class="btn btn-link float-right navbar-touch-caret" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">--%>
<%--                                    <span class="sr-only"><%t CWP_Theme.DISPLAY_SUBMENU_PAGES "Display {count} submenu pages" count=$MenuTitle.XML %></span>--%>
<%--                                    <i class="fal fa-angle-down" aria-hidden="true"></i>--%>
<%--                                </button>--%>
<%--                                <ul class="dropdown-menu" role="menu" aria-hidden="true">--%>
<%--                                    <% loop $Children %>--%>
<%--                                        <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">--%>
<%--                                            <a class="dropdown-item" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>--%>
<%--                                                <span class="h6 assistant font-weight-medium">$MenuTitle.XML</span>--%>
<%--                                            </a>--%>
<%--                                        </li>--%>
<%--                                    <% end_loop %>--%>
<%--                                </ul>--%>
<%--                            <% end_if %>--%>
<%--                        </li>--%>
<%--                    <% end_loop %>--%>
<%--                </ul>--%>
<%--                 <div class="d-block search-form">--%>
<%--                 $SearchForm--%>
<%--                    <form class="form-inline" action="/search/SearchForm">--%>
<%--                        <% include HeaderSearch ExtraClass="col-12 pt-2 pb-2" %>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>
