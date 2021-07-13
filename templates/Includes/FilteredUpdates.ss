<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% loop $FilteredUpdates(10) %>
        <div class="<% if $Pos == 1 || $Pos == 4 || $Pos == 7 || $Pos == 10 || $Pos == 13 %>col-lg-6 <% if $Pos == 1 %>order-3<% end_if %><% if $Pos == 7 %>order-9<% end_if %><% if $Pos == 13 %>order-15<% end_if %><% else %>col-lg-3 <% if $Pos == 2 %>order-1<% end_if %><% if $Pos == 3 %>order-2<% end_if %><% if $Pos == 8 %>order-7<% end_if %><% if $Pos == 9 %>order-8<% end_if %><% if $Pos == 14 %>order-13<% end_if %><% if $Pos == 15 %>order-14<% end_if %><% end_if %><% if $Pos == 4 || $Pos == 5 || $Pos == 6 || $Pos == 10 || $Pos == 11 || $Pos == 12 %>order-{$Pos}<% end_if %>">
            <article class="news-events-article listing__item<% if $ClassName == 'CWP\CWP\PageTypes\NewsPage' || $ClassName == 'CWP\CWP\PageTypes\NewsHolder' %>--news-events<% end_if %> clearfix">
                <% if $Image %>
                    <a href="$Link" class="blog-link">
                        <figure class="news-events-item-figure">
                            <img src="$Image.URL" alt="$SiteConfig.Title - $Title" class="blog-image">
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
                    <h4 class="listing__title"><a href="$Link" class="text-light"><span class="font-weight-bold lineheight-1">$Title</span></a></h4>
                    <div class="listing__authors">
                        <% loop $Authors %>
                            <a href="$Link" class="text-light">
                                 <p class="author-text--name poppins small font-weight-semibold"><% loop $ProfileImages.Limit(1) %><img src="$URL" class="authors-image" alt="$SiteConfig.Title - $Title" ><% end_loop %> $Title &mdash; $Position</p>
                            </a>
                        <% end_loop %>
                    </div>
                </div>
<%--                <p class="mt-3 mb-3">--%>
<%--                    <% if $Abstract %>--%>
<%--                        $Abstract.LimitWordCount(13)--%>
<%--                    <% else %>--%>
<%--                        $Content.LimitWordCount(13)--%>
<%--                    <% end_if %>--%>
<%--                </p>--%>
<%--                <% if $Authors %><% loop $Authors %><% if $ProfileImages %><% loop $ProfileImages.Limit(1) %><img src="$URL" class="blog-author--img" alt="$SiteConfig.Title - Blog Author({$Title})" style="max-width: 40px;margin: 0 10px 0 0;border-radius: 100px;"><% end_loop %><% end_if %><a href="$Link"><span class="small">$Title</span></a><span class="small font-weight-light poppins">  &mdash; $Position</span><% end_loop %><% end_if %>--%>
<%--                <p class="mt-4"><a href="$Link"><span class="h6 font-weight-normal mb-0 btn-radius btn-bg-gradient-sml poppins">Read post</span></a></p>--%>
            </article>
        </div>
        <% end_loop %>
    </div>
</div>
<% with $FilteredUpdates(10) %>
    <% include Pagination %>
<% end_with %>
