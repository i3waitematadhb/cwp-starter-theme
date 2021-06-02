<div class="container-fluid p-0">
    <svg viewBox="0 0 1440 210" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1741 340H-791c48.773-30.449 107.998-57.561 175.583-82.588 172.794-62.567 333.744-136.399 508.629-196.464C-15.513 29.664 93.178.885 194.904.05 517.5-2.035 819.891 60.533 1114.62 134.363c85.7 21.273 167.92 52.138 257.1 62.983 122.63 14.599 245.96 30.033 368.59 44.632V340h.69z" fill="#ff7b1e"></path>
    </svg>
</div>
<div class="bg-brand">
    <div class="container-fluid pl-lg-8 pr-lg-8 pb-lg-7 p-5">
        <div class="row">
            <% if $FooterItems %>
                <% loop $FooterItems %>
                    <div class="$Width pb-3">
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
</div>
