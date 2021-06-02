<div class="row no-gutters">
    <div class="col-lg-<% if $ContentPosition == 'cp-top' || $ContentPosition == 'cp-bottom' %>12<% if $ContentPosition == 'cp-bottom' %> order-2<% end_if %><% else %>6 d-flex align-items-center<% if $ContentPosition == 'cp-right' %> order-2<% end_if %><% end_if %><% if $ReadableContentPaddings %><% loop $ReadableContentPaddings %> $Name<% end_loop %><% end_if %>">
        <div class="image-text--text {$ContentContainer} wow animate__animated<% if $ContentPosition == 'cp-right' %> animate__fadeInRight<% end_if %><% if $ContentPosition == 'cp-left' %> animate__fadeInLeft<% end_if %><% if $ContentPosition == 'cp-top' || $ContentPosition == 'cp-bottom' %> animate__fadeInUp<% end_if %>">$Content</div>
    </div>
    <div class="col-lg-<% if $ContentPosition == 'cp-top' || $ContentPosition == 'cp-bottom' %>12<% if $ContentPosition == 'cp-bottom' %> order-1<% end_if %><% else %>6 d-flex align-items-center<% if $ContentPosition == 'cp-right' %> order-1<% end_if %><% end_if %>">
        <div class="image-text--image wow animate__animated<% if $ContentPosition == 'cp-right' %> animate__fadeInLeft<% end_if %><% if $ContentPosition == 'cp-left' %> animate__fadeInRight<% end_if %><% if $ContentPosition == 'cp-top' || $ContentPosition == 'cp-bottom' %> animate__fadeInUp<% end_if %>"><% if $Image %><img src="$Image.URL" alt="$Name - $SiteConfig.Title"><% end_if %></div>
    </div>
</div>
