<div class="card-content">
    <div class="container-fluid">
        <div class="row">
            <% if $VisibleCardItems %>
                <% loop $VisibleCardItems %>
                    <div class="{$CardWidth}<% if $Animation != 'none' %> wow animate__animated $Animation<% end_if %>" <% if $CardType == 'card-bgcolor' %> style="background-clip:content-box;<% if $CardBgColor %>background-color: #{$CardBgColor};<% else %>background-color: #fff;<% end_if %>"<% end_if %>>
                        <div class="card mb-3<% if $CardType == 'card-bgcolor' %> with-bgColor<% end_if %>">
                            <% if $CardType == 'card-image' %>
                                <% if $Page %><a href="$Page.Link"><% end_if %>
                                <% if $Image %>
                                    <img class="card-img-top" src="{$Image.URL}" alt="$Title - $SiteConfig.Title">
                                <% end_if %>
                                <% if $Page %></a><% end_if %>
                            <% end_if %>
                            <div class="card-body<% if $CardType == 'card-image' %><% if $ContentOverlay %> content-overlay<% end_if %><% end_if %>">
                                <% if $Icon %>$Icon.RAW<% end_if %>
                                {$Content}
                            </div>
                        </div>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>
