<div class="menu-drawer">
    <div class="menu-drawer-container">
        <div class="menu-drawer-content">
            <div class="nav-items d-flex align-content-center flex-wrap">
                <ul class="menu-items">
                <% loop Menu(1) %>
                    <li role="menuitem" class="nav-item $FirstLast $LinkingMode<% if $LinkingMode = current %> active<% end_if %><% if $Children %> dropdown <% end_if %>">
                        <a href="$Link" <% if $LinkingMode = current %>aria-current="page"<% end_if %> class="nav-link $LinkingMode"><span class=" display-6 ff-clan text-white font-weight-medium">$MenuTitle.XML</span></a>
                        <% if $Children %>
                        <button class="btn btn-link float-right navbar-touch-caret" aria-haspopup="true" aria-expanded="false" data-toggle="dropdown-{$ID}">
                            <span class="sr-only ff-clan"><%t CWP_Theme.DISPLAY_SUBMENU_PAGES "Display {count} submenu pages" count=$MenuTitle.XML %></span>
                            <i class="fal fa-angle-right text-white" aria-hidden="true"></i>
                        </button>
                        <% end_if %>
                    </li>
                <% end_loop %>
                </ul>
                <div class="dropdown-items">
                    <% loop Menu(1) %>
                    <ul class="child-menu" data-toggle="dropdown-{$ID}">
                        <li class="p-0 close-child-menu"><button class="go-back"><i class="fal fa-angle-left text-white" aria-hidden="true"></i> <span class="text-white">Menu</span></button></li>
                        <li class="menu-title"><span class="display-6 font-weight-semibold">$MenuTitle.XML</span></li>
                        <% loop $Children %>
                            <li><a class="dropdown-item text-white" role="menuitem" href="$Link">$MenuTitle.XML</a></li>
                        <% end_loop %>
                    </ul>
                    <% end_loop %>
                </div>
            </div>
            <div class="site-socials">
                <div class="social-item"><a href="#" rel="noreferrer nofollow"><span class="text-white"><i class="fab fa-twitter"></i></span></a></div>
                <div class="social-item"><a href="#" rel="noreferrer nofollow"><span class="text-white"><i class="fab fa-facebook"></i></span></a></div>
                <div class="social-item"><a href="#" rel="noreferrer nofollow"><span class="text-white"><i class="fas fa-envelope"></i></span></a></div>
            </div>
        </div>
    </div>
</div>
