<% if $VisibleSections %>
    <% loop $VisibleSections %>
        <section id="section-{$DisplayTypeTrim}{$ID}" class="page-section section-{$DisplayTypeTrim} {$SectionWidth}<% if $SectionBgType == 'background-image' %> section-bgImg<% end_if %> wow animate__animated animate__fadeIn animate__slow" <% if $SectionBgType != 'none' %><% if $SectionBgType == 'background-image' || $SectionBgType == 'background-color' || $SectionBgType == 'background-gradient' %><% if $SectionBgImage || $SectionBgColor || $ColorGradient1 && $ColorGradient2 %> style="<% if $SectionBgType == 'background-image' %>background-image:url('{$SectionBgImage.URL}');<% else_if $SectionBgType == 'background-gradient' %>background-image: linear-gradient(-90deg, #{$ColorGradient1} -50%, #{$ColorGradient2} 100%);<% else %>background-color:#{$SectionBgColor};<% end_if %>"<% end_if %><% end_if %><% end_if %>>
            <% if $CodeEditor %>
                $CodeEditor
            <% end_if %>
            <div class="{$SectionContainer}">
                <div class="section-container<% if $ReadablePaddings %><% loop $ReadablePaddings %> $Name<% end_loop %><% end_if %><% if $ReadableMobilePaddings %> <% loop $ReadableMobilePaddings %> $Name<% end_loop %><% end_if %>">
                    <div class="container-fluid p-0">
                        <div class="row no-gutters">
                            <% if $ShowSectionHeader %>
                                <div class="<% if $SectionHeaderPosition == 'position-top'%>col-lg-12<% else %>col-lg-4<% if $SectionHeaderPosition == 'position-right' %> order-last<% end_if %><% end_if %>">
                                    <div class="section-header<% if $ReadableHeaderPaddings %><% loop $ReadableHeaderPaddings %> $Name<% end_loop %><% end_if %> wow animate__animated animate__fadeInUp">
                                        <% if $SectionHeader %>
                                            $SectionHeader
                                        <% else %>
                                            <h1 class="section-header--title<% if $SectionHeaderPosition == 'position-top'%> text-center<% end_if %> theme-text-gradient">Your header goes here.</h1>
                                        <% end_if %>
                                    </div>
                                </div>
                            <% end_if %>
                            <div class="<% if $ShowSectionHeader %><% if $SectionHeaderPosition != 'position-top' %>col-lg-8<% if $SectionHeaderPosition == 'position-right' %> order-first<% end_if %><% else %>col-lg-12<% end_if %><% else %>col-lg-12<% end_if %>">
                                <div class="{$DisplayTypeTrim}-container section-body">
                                    $Show
                                </div>
                            </div>
                            <% if $ShowSectionFooter %>
                                <div class="col-md-12">
                                    <div class="section-footer<% if $ReadableFooterPaddings %><% loop $ReadableFooterPaddings %> $Name<% end_loop %><% end_if %> text-center wow animate__animated animate__fadeInUp">
                                        <% if $SectionFooter %>{$SectionFooter}<% end_if %>
                                    </div>
                                </div>
                            <% end_if %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <% end_loop %>
<% else %>
    <section class="no-section"></section>
<% end_if %>
