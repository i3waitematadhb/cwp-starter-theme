<div class="accordion-content">
    <% if $VisibleAccordionItems %>
        <% loop $VisibleAccordionItems %>
            <div class="accordion-item">
                <button class="accordion font-weight-bold source-sans-pro">$Name <i class="fal fa-angle-down"></i><i class="fal fa-times"></i></button>
                <div class="panel">
                    <div class="accordion-content">
                        $Content
                    </div>
                </div>
            </div>
        <% end_loop %>
    <% end_if %>
</div>
