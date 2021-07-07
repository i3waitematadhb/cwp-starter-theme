<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% loop $FilteredUpdates(10) %>
        <div class="col-lg-12">
            <article class="news-events-article listing__item<% if $ClassName == 'CWP\CWP\PageTypes\NewsPage' || $ClassName == 'CWP\CWP\PageTypes\NewsHolder' %>--news-events<% end_if %> clearfix">
                <% if $Image %>
                    <figure class="float-left news-events-item-figure">
                        $Image.Fill(200, 200)
                    </figure>
                <% end_if %>
                <h5 class="listing__title"><a href="$Link"><span class="font-weight-bold">$Title</span></a></h5>
                <% if $Up.ControllerName == 'CWP\\CWP\\PageTypes\\EventHolder' %>
                    <% if $Date %>
                        <p class="meta-info">
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
                        <p class="meta-info">
                            <% if $Date %>
                                <time datetime="$Date">$Date.Format('dd MMM y')<% if $StartTime %>$StartTime.Nice <% end_if %>
                                </time>
                            <% end_if %>
                        </p>
                    <% end_if %>
                <% end_if %>
                <p class="mt-3 mb-3">
                    <% if $Abstract %>
                        $Abstract.LimitWordCount(13)
                    <% else %>
                        $Content.LimitWordCount(13)
                    <% end_if %>
                </p>
                <% if $Authors %><% loop $Authors %><% if $ProfileImages %><% loop $ProfileImages.Limit(1) %><img src="$URL" class="blog-author--img" alt="$SiteConfig.Title - Blog Author({$Title})" style="max-width: 40px;margin: 0 10px 0 0;border-radius: 100px;"><% end_loop %><% end_if %><a href="$Link"><span class="small">$Title</span></a><span class="small font-weight-light poppins">  &mdash; $Position</span><% end_loop %><% end_if %>
                <p class="mt-4"><a href="$Link"><span class="h6 font-weight-normal mb-0 btn-radius btn-bg-gradient-sml poppins">Read full post</span></a></p>
            </article>
        </div>
        <% end_loop %>
    </div>
</div>
<% with $FilteredUpdates(10) %>
    <% include Pagination %>
<% end_with %>
