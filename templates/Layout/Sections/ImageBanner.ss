<% if $Image %>
    <div class="image-banner--image {$ImageHeight}<% if $ImageOverlay != 'none' %> $ImageOverlay<% end_if %>" style="background-image: url('{$Image.URL}');" data-height="<% if $ImageHeight == 'bh-large' %>100<% end_if %><% if $ImageHeight == 'bh-medium' %>80<% end_if %><% if $ImageHeight == 'bh-small' %>40<% end_if %>"></div>
<% end_if %>
<div class="image-banner--text {$ContentPosition}">$Content</div>
<% if $ScrollIcon %><% include MouseIconScroll %><% end_if %>
<%--<% if $ImageOverlay != 'none'%>--%>
<%--    <div class="overlay-{$ImageOverlay}">--%>
<%--<% end_if %>--%>
<%--<% if $Image %>--%>
<%--    <img src="$Image.URL" alt="$Title - $SiteConfig.Title" class="$ImageHeight<% if $IsParallax %> parallax-image<% end_if %>" data-height="<% if $ImageHeight == 'large' %>103<% end_if %><% if $ImageHeight == 'medium' %>80<% end_if %><% if $ImageHeight == 'small' %>40<% end_if %>">--%>
<%--<% else %>--%>
<%--    <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title" class="$ImageHeight">--%>
<%--<% end_if %>--%>
<%--<% if $ImageOverlay != 'none'%></div><% end_if %>--%>
<%--<% if $Content %>--%>
<%--    <div class="imageBanner-content {$ContentPosition}">--%>
<%--        $Content--%>
<%--    </div>--%>
<%--<% end_if %>--%>
<%--<% if $ScrollIcon %>--%>
<%--    <div class="scroll-down">--%>
<%--       <div class="icon-scroll"></div>--%>
<%--    </div>--%>
<%--<% end_if %>--%>
