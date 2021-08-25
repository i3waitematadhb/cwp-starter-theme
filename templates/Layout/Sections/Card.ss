<% if $VisibleCardItems %>
<div class="card-wrapper">
    <div class="row">
        <% loop $VisibleCardItems %>
        <div class="{$CardWidth}">
            <div class="card">
                <% if $Image %>
                <img class="card-img-top" src="{$Image.URL}" alt="Card image cap">
                <% end_if %>
                <div class="card-body">
                    <% if $CardIcon %>
                    <h1 class="text-brand text-center"><i class="$CardIcon.RAW"></i></h1>
                    <% end_if %>
                    $Content
                </div>
            </div>
        </div>
        <% end_loop %>
    </div>
</div>
<% end_if %>
