<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% if $VisibleSections %>
            <% loop $VisibleSections %>
                <section id="section-{$DisplayTypeTrim}{$ID}" class="page-section section-{$DisplayTypeTrim} $Width">
                    <div class="section-wrapper">
                        <% if $CodeEditor %>
                            <div class="code-editor">
                                $CodeEditor
                            </div>
                        <% end_if %>
                        <div class="{$DisplayTypeTrim}-container<% if $BgImage %> withBgImage<% end_if %>" <% if $BgImage %>style="background-image: url('{$BgImage.URL}')"<% end_if %>>
                            $Show
                        </div>
                    </div>
                </section>
            <% end_loop %>
        <% end_if %>
    </div>
</div>
