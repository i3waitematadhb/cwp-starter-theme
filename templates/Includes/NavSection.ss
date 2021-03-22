<section class="navigation">
    <ul class="d-md-flex list-unstyled">
        <% loop Menu(1) %>
            <li class="navi-item <% if $Pos == 1 %>first-item<% end_if %>" role="menuitem">
                <div class="navi-content">
                    <a href="$Link" <% if $LinkingMode = current %>aria-label="current page"<% end_if %> class="nav-link $LinkingMode source-sans-pro display-2 font-weight-bolder theme-text-gradient"><span>{$MenuTitle.XML}.</span></a>
                    <% if $Children %>
                        <ul class="dropdown-menu" role="menu" aria-hidden="true">
                            <% loop $Children %>
                                <li role="menuitem" class="dropdown-menu-item <% if $LinkingMode = current %>active <% end_if %>">
                                    <a class="dropdown-item source-sans-pro h5 m-0 border-0 font-weight-semibold pt-xl-4 pb-xl-4 pt-2 pb-2" role="menuitem" href="$Link" <% if $LinkingMode = current %>aria-label="current page" <% end_if %>>
                                       <span>$MenuTitle.XML</span>
                                    </a>
                                </li>
                            <% end_loop %>
                        </ul>
                    <% end_if %>
                </div>
                <div class="navi-item--bg"></div>
            </li>
        <% end_loop %>
    </ul>
</section>
