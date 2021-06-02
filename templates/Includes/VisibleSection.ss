<% if $VisibleSections %>
    <% loop $VisibleSections %>
        <section id="section-{$DisplaySectionTypeTrim}{$ID}" class="page-section<% if $EnableNav %> section<% end_if %> section-{$DisplaySectionTypeTrim} $Width" data-bg="<% if $BgColor %>#{$BgColor}<% else %>#F7F9FB<% end_if %>"><div class="{$Container}"><div class="section-content<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %>">$Show</div></div></section>
    <% end_loop %>
<% end_if %>
