<% if $VisibleSections %>
<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% loop $VisibleSections %>
            <section id="section-{$DisplayTypeTrim}{$ID}" class="page-section {$DisplayTypeTrim} {$Width} $Animation <% if $Animation %>wow animate__animated animate__{$Animation}<% end_if %>"><div class="section-wrapper<% if $Height != 'none' %> $Height<% end_if %> d-flex align-items-center"><div class="section-inner">$Show</div></div></section>
        <% end_loop %>
    </div>
</div>
<% end_if %>
