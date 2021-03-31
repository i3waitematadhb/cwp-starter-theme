<div class="featuredNews-content d-flex flex-row">
    <% if $ContentPosition == 'content-left' %>
        <div class="featuredNews-text content-left align-self-center">
            <div class="content-text bg-white p-5">
                <% if $Content %>
                    $Content
                <% end_if %>
            </div>
        </div>
    <% end_if %>
    <div class="featuredNews-image">
        <% if $Image %>
            <img src="$Image.URL" class="featuredNews-img" alt="$Title - $SiteConfig.Title">
        <% end_if %>
    </div>
    <% if $ContentPosition == 'content-right' %>
        <div class="featuredNews-text content-right align-self-center">
            <div class="content-text bg-white p-5">
                <% if $Content %>
                    $Content
                <% end_if %>
            </div>
        </div>
    <% end_if %>
 </div>
