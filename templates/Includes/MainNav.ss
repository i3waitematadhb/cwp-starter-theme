<div class="main-nav">
    <nav class="navbar navbar-expand-md navbar-light" aria-label="<%t CWP_Theme.MAIN 'Main' %>" role="navigation">
        <div class="container p-0">
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav" role="menubar">
                    <% loop Menu(1) %>
                        <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                            <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span class="h6 assistant spacing-1 font-weight-medium">$MenuTitle.XML</span></a>
                            <% if $Children %>
<%--                                <button class="btn btn-link float-right navbar-touch-caret" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown">--%>
<%--                                    <span class="sr-only"><%t CWP_Theme.DISPLAY_SUBMENU_PAGES "Display {count} submenu pages" count=$MenuTitle.XML %></span>--%>
<%--                                    <i class="fal fa-angle-down" aria-hidden="true"></i>--%>
<%--                                </button>--%>
                                <ul class="dropdown-menu" role="menu" aria-hidden="true">
                                    <% loop $Children %>
                                        <li role="menuitem" class="<% if $LinkingMode = current %>active <% end_if %>">
                                            <a class="dropdown-item" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
                                                <span class="h6 assistant font-weight-medium">$MenuTitle.XML</span>
                                            </a>
                                        </li>
                                    <% end_loop %>
                                </ul>
                            <% end_if %>
                        </li>
                    <% end_loop %>
                </ul>
                 <div class="d-block search-form">
                 $SearchForm
<%--                    <form class="form-inline" action="/search/SearchForm">--%>
<%--                        <% include HeaderSearch ExtraClass="col-12 pt-2 pb-2" %>--%>
<%--                    </form>--%>
                </div>
            </div>
        </div>
    </nav>
</div>
