<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% loop $FilteredUpdates(10) %>
        <div class="<% if $Pos == 1 || $Pos == 4 || $Pos == 7 || $Pos == 10 || $Pos == 13 %>col-lg-6 <% if $Pos == 1 %>order-3<% end_if %><% if $Pos == 7 %>order-9<% end_if %><% if $Pos == 13 %>order-15<% end_if %><% else %>col-lg-3 <% if $Pos == 2 %>order-1<% end_if %><% if $Pos == 3 %>order-2<% end_if %><% if $Pos == 8 %>order-7<% end_if %><% if $Pos == 9 %>order-8<% end_if %><% if $Pos == 14 %>order-13<% end_if %><% if $Pos == 15 %>order-14<% end_if %><% end_if %><% if $Pos == 4 || $Pos == 5 || $Pos == 6 || $Pos == 10 || $Pos == 11 || $Pos == 12 %>order-{$Pos}<% end_if %>">
            <article class="news-events-article listing__item<% if $ClassName == 'CWP\CWP\PageTypes\NewsPage' || $ClassName == 'CWP\CWP\PageTypes\NewsHolder' %>--news-events<% end_if %> clearfix">
                <% if $Image %>
                    <a href="$Link" class="blog-link">
                        <figure class="news-events-item-figure">
                            <% if $Image %>
                                <img src="$Image.URL" alt="$SiteConfig.Title - $Title" class="blog-image">
                            <% else %>
                                <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title" class="blog-image">
                            <% end_if %>
                        </figure>
                    </a>
                <% end_if %>
                <div class="blog-details">
                    <% if $Up.ControllerName == 'CWP\\CWP\\PageTypes\\EventHolder' %>
                        <% if $Date %>
                            <p class="meta-info text-light">
                                <% if $Location %>
                                    $NiceLocation,
                                <% end_if %>
                                <% if $Date %>
                                    <time datetime="$Date">$Date.Format('dd MMM y') <% if $StartTime %>$StartTime.Format(h:mma) <% if $EndTime %>- $EndTime.Format(h:mma) <% end_if %><% end_if %></time>
                                <% end_if %>
                            </p>
                        <% end_if %>
                    <% else_if $Up.ControllerName == 'CWP\\CWP\\PageTypes\\NewsHolder' %>
                        <% if $Date %>
                            <p class="meta-info text-light font-weight-semibold small">
                                <% if $Date %>
                                    <time datetime="$Date">$Date.Format('dd MMM y')<% if $StartTime %>$StartTime.Nice <% end_if %>
                                    </time>
                                <% end_if %>
                            </p>
                        <% end_if %>
                    <% end_if %>
                    <h5 class="listing__title mb-3"><a href="$Link" class="text-light"><span class="font-weight-semibold">$Title</span></a></h5>
                    <div class="listing__authors">
                        <% loop $Authors %>
                            <a href="$Link" class="text-light">
                                 <p class="author-text--name d-flex align-items-center"><% loop $ProfileImages.Limit(1) %><img src="$URL" class="authors-image" alt="$SiteConfig.Title - $Title" ><% end_loop %> <span class="poppins small font-weight-semibold">$Title<% if $Position %> &mdash; $Position<% end_if %></span></p>
                            </a>
                        <% end_loop %>
                    </div>
                </div>
            </article>
        </div>
        <% end_loop %>
    </div>
</div>
<% with $FilteredUpdates(10) %>
    <% include Pagination %>
<% end_with %>
