<div class="contentSection-content<% if $ContentAnimation != 'None' %> wow animate__animate $ContentAnimation<% end_if %>">
    <% if $Content %>
        $Content
    <% end_if %>
</div>
<% if $ScrollIcon %><% include MouseIconScroll %><% end_if %>
