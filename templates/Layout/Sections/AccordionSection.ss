<% if $Content %>
    $Content
<% end_if %>
<% if $VisibleAccordionItems %>
    <% loop $VisibleAccordionItems %>
        <button class="accordion-btn"><span class="h4 font-weight-light lineheight-3 spacing-1">$Name</span> <i class="fal fa-chevron-down"></i></button>
        <div class="panel">
            <div class="panel--content">$Content</div>
        </div>
    <% end_loop %>
<% end_if %>
