<% if $Video %>
    <video playsinline autoplay muted loop id="video-content" data-keepplaying class="{$VideoHeight}"><source src="$Video.URL" type="video/mp4"></video>
<% else %>
    <video playsinline autoplay muted loop id="video-content" data-keepplaying class="{$VideoHeight}"><source src="{$resourceURL('themes/starter/images/default-video.mp4')}" type="video/mp4"></video>
<% end_if %>
<% if $Content %>
    <div class="videoBanner-content {$ContentPosition}">
        <div class="<% if $ContentAnimation != 'none' %> wow animate__animated $ContentAnimation<% end_if %>">$Content</div>
    </div>
<% end_if %>
<% if $ScrollIcon %><% include MouseIconScroll %><% end_if %>
