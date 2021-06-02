<div class="grid">
    <% if $VisibleMasonryItems %>
        <% loop $VisibleMasonryItems %>
            <div class="masonry-item">
                <% if $Image %><div class="masonry-item--image<% if $ReadableImagePaddings %><% loop $ReadableImagePaddings %> $Name<% end_loop %><% end_if %><% if $Animation %> wow animate__animated $Animation<% end_if %>"><img src="$Image.URL" class="$ImageSize" alt="$Name - $SiteConfig.Title"></div><% end_if %>
                <% if $Content %><div class="masonry-item--text<% if $ReadableContentPaddings %><% loop $ReadableContentPaddings %> $Name<% end_loop %><% end_if %><% if $Animation %> wow animate__animated $Animation<% end_if %>">$Content</div><% end_if %>
            </div>
        <% end_loop %>
    <% end_if %>
</div>
