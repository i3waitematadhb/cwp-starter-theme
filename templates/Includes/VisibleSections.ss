<% if $VisibleSections %>
<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% loop $VisibleSections %>
            <section id="section-{$DisplayTypeTrim}{$ID}" class="page-section {$DisplayTypeTrim} {$Width}<% if $AnimationType %> wow animate__animated {$AnimationType}<% end_if %>"><div class="section-wrapper">$Show</div></section>
        <% end_loop %>
    </div>
</div>
<% end_if %>
