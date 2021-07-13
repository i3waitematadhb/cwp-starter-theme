<div class="peopleList-content">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <% if $Staff %>
                <% loop $Staff %>
                    <div class="<% if $Up.NumPerRow == 2 %>col-lg-6 wow animate__animated <% if $Even %>animate__fadeInRight<% else %>animate__fadeInLeft<% end_if %><% else_if $Up.NumPerRow == 3 %>col-lg-4 col-6 wow animate__animated <% if $Pos == 1 || $Pos == 4 || $Pos == 7 || $Pos == 10 || $Pos == 13 || $Pos == 16 || $Pos == 19 %>animate__fadeInRight<% end_if %><% if $Pos == 2 || $Pos == 5 || $Pos == 8 || $Pos == 11 || $Pos == 14 || $Pos == 17 || $Pos == 20 %>animate__fadeInUp<% end_if %><% if $Pos == 3 || $Pos == 6 || $Pos == 9 || $Pos == 12 || $Pos == 15 || $Pos == 18 || $Pos == 21 %>animate__fadeInRight<% end_if %><% else %>col-lg-3 col-6 wow animate__animated <% if $Pos == 1 || $Pos == 5 || $Pos == 9 || $Pos == 13 || $Pos == 17 || $Pos == 21 || $Pos == 25 || $Pos == 29 || $Pos == 33 || $Pos == 37 || $Pos == 41 %>animate__fadeInLeft<% end_if %><% if $Pos == 2 || $Pos == 6 || $Pos == 10 || $Pos == 14 || $Pos == 18 || $Pos == 22 || $Pos == 26 || $Pos == 30 || $Pos == 34 || $Pos == 38 || $Pos == 42 %>animate__fadeInUp<% end_if %><% if $Pos == 3 || $Pos == 7 || $Pos == 11 || $Pos == 15 || $Pos == 19 || $Pos == 23 || $Pos == 27 || $Pos == 31 || $Pos == 35 || $Pos == 39 || $Pos == 43 %>animate__fadeInDown<% end_if %><% if $Pos == 4 || $Pos == 8 || $Pos == 12 || $Pos == 16 || $Pos == 20 || $Pos == 24 || $Pos == 28 || $Pos == 32 || $Pos == 36 || $Pos == 40 || $Pos == 44 %>animate__fadeInRight<% end_if %><% end_if%>">
                        <div class="staff-item">
                            <a href="$Link">
                                <div class="staff-item__image">
                                    <% if $ProfileImages %>
                                        <% loop $ProfileImages %>
                                            <img src="{$URL}" class="" alt="Institute of Innovation + Improvement - $Up.Title">
                                        <% end_loop %>
                                    <% else %>
                                        <img src="$resourceURL('themes/starter/dist/images/DefaultImage.PNG')" class="" alt="Institute of Innovation + Improvement - $Up.Title">
                                    <% end_if %>
                                </div>
                                <div class="staff-item__content">
                                    <h3 class="staff-name text-white font-weight-bold mb-md-2">$Title</h3>
                                    <p class="staff-position text-white">$Position</p>
                                </div>
                            </a>
                        </div>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>
