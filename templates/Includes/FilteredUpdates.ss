<div class="container-fluid">
    <div class="row">
        <% loop $FilteredUpdates(10) %>
        <div class="col-lg-12">
            <article class="news-events-article listing__item<% if $ClassName == 'CWP\CWP\PageTypes\NewsPage' || $ClassName == 'CWP\CWP\PageTypes\NewsHolder' %>--news-events<% end_if %> clearfix">
                <% if $Image %>
                    <figure class="float-left news-events-item-figure">
                        $Image.Fill(150, 150)
                    </figure>
                <% end_if %>
                <h1 class="h4 listing__title"><a href="$Link">$Title</a></h1>
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

                    <% if $Date || $Authors %>
                        <p class="meta-info">
                            <% if $Date %>
                                <time datetime="$Date">$Date.Format('dd MMM y')<% if $StartTime %>$StartTime.Nice <% end_if %>
                                </time>
                            <% end_if %>
                            <% if $Authors %>
                                <% loop $Authors %>
                                    $Title
                                <% end_loop %>
                            <% end_if %>
                        </p>
                    <% end_if %>

                <% end_if %>
                <p>
                    <% if $Abstract %>
                        $Abstract.LimitWordCount(10)
                    <% else %>
                        $Content.LimitWordCount(20)
                    <% end_if %>
                </p>
                <p><a href="$Link"><span class="">Read full post</span></a></p>
            </article>
        </div>
        <% end_loop %>
    </div>
</div>
<% with $FilteredUpdates(10) %>
    <% include Pagination %>
<% end_with %>
