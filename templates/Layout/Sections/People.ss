<div class="peopleList-content">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <% if $Staff %>
                <% loop $Staff %>
                    <div class="<% if $Up.NumPerRow == 2 %>col-lg-6 wow animate__animated <% if $Even %>animate__fadeInRight<% else %>animate__fadeInLeft<% end_if %><% else_if $Up.NumPerRow == 3 %>col-xl-4 col-lg-6 wow animate__animated <% if $Pos == 1 || $Pos == 4 || $Pos == 7 %>animate__fadeInRight<% end_if %><% if $Pos == 2 || $Pos == 5 || $Pos == 8 %>animate__fadeInUp<% end_if %><% if $Pos == 3 || $Pos == 6 || $Pos == 9 %>animate__fadeInRight<% end_if %><% else %>col-lg-3 col-lg-6 wow animate__animated <% if $Pos == 1 || $Pos == 5 %>animate__fadeInLeft<% end_if %><% if $Pos == 2 || $Pos == 6 %>animate__fadeInUp<% end_if %><% if $Pos == 3 || $Pos == 7 %>animate__fadeInDown<% end_if %><% if $Pos == 4 || $Pos == 8 %>animate__fadeInRight<% end_if %><% end_if%>">
                        <div class="staff-item">
                            <a href="$Link">
                                <div class="staff-item__image">
                                    <% if $ProfileImages %>
                                        <% loop $ProfileImages %>
                                            <img src="{$URL}" class="" alt="Institute of Innovation + Improvement - $Up.Title">
                                        <% end_loop %>
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
