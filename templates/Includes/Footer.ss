<div class="container-fluid">
    <div class="row">
        <% if $FooterItems %>
            <% loop $FooterItems %>
                <div class="$Width">
                    <% if $Type == 'Content' %>
                        $Content
                    <% end_if %>
                    <% if $Type == 'Code' %>
                        $Code.RAW
                    <% end_if %>
                </div>
            <% end_loop %>
        <% end_if %>
    </div>
</div>
