<% if $Video %>
    <video playsinline autoplay muted loop id="video-content"><source src="$Video.URL" type="video/mp4"></video>
<% else %>
    <video playsinline autoplay muted loop id="video-content"><source src="{$resourceURL('themes/starter/images/default-video.mp4')}" type="video/mp4"></video>
<% end_if %>
<% if $Content %>
    <div class="videoBanner-content {$ContentPosition}">
        $Content
    </div>
<% end_if %>
