<div class="blogList-content">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <% if $NewsPage %>
                <% loop $NewsPage %>
                    <div class="wow animate__animated <% if $Pos == 1 || $Pos == 4 || $Pos == 7 %>col-lg-6<% if $Pos == 1 %> order-3 animate__fadeInRight<% end_if %><% if $Pos == 4 %> order-4 animate__fadeInLeft<% end_if %><% if $Pos == 7 %> order-9 animate__fadeInRight<% end_if %><% else %>col-lg-3<% if $Pos == 2 %> order-1 animate__fadeInUp<% end_if %><% if $Pos == 3 %> order-2 animate__fadeInUp<% end_if %><% if $Pos == 5 || $Pos == 6 %> order-$Pos animate__fadeInUp<% end_if %><% if $Pos == 8 %> order-7 animate__fadeInUp<% end_if %><% if $Pos == 9 %> order-8 animate__fadeInUp<% end_if %><% end_if %>">
                        <div class="blog-item">
                            <a href="$Link">
                                <div class="blog-image">
                                    <% if $Image %>
                                        <img src="{$Image.URL}" alt="$Title - $SiteConfig.Title" class="featured-img">
                                    <% else %>
                                        <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title" class="image">
                                    <% end_if %>
                                </div>
                            </a>
                            <div class="blog-details">
                                <% if $Date %>
                                    <p class="text-light small font-weight-semibold">
                                        <time datetime="$Date">$Date.Format('dd MMM y') <% if $StartTime %>$StartTime.Format(h:mma) <% if $EndTime %>- $EndTime.Format(h:mma) <% end_if %><% end_if %></time>
                                    </p>
                                <% end_if %>
                                <div class="blog-title mb-3"><a href="$URL"><span class="font-weight-semibold text-light h5">$Title</span></a></div>
                                <% if $Authors %>
                                <div class="blog-authors mt-3">
                                    <% loop $Authors %>
                                    <a href="$Link" class="text-light">
                                         <p class="author-text--name d-flex align-items-center"><% loop $ProfileImages.Limit(1) %><img src="$URL" class="authors-image" alt="$SiteConfig.Title - $Title" ><% end_loop %> <span class="poppins small font-weight-semibold">$Title<% if $Position %> &mdash; $Position<% end_if %></span></p>
                                    </a>
                                    <% end_loop %>
                                </div>
                                <% end_if %>
                            </div>
                        </div>
                    </div>
<%--                    <div class="col-xl-3 col-lg-6 wow animate__animated animate__fadeInUpBig" data-wow-delay="0.{$Pos}s">--%>
<%--                        <div class="blog-item">--%>
<%--                            <a href="$Link">--%>
<%--                                <div class="blog-item--image">--%>
<%--                                    <% if $Image %>--%>
<%--                                        <img src="{$Image.URL}" alt="$Title - $SiteConfig.Title" class="image">--%>
<%--                                    <% else %>--%>
<%--                                        <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title" class="image">--%>
<%--                                    <% end_if %>--%>

<%--                                    <div class="teaser-date">--%>
<%--                                        <div class="teaser-date--inner poppins">--%>
<%--                                            <span class="day font-weight-bold">$Date.DayOfMonth</span>--%>
<%--                                            <span class="month font-weight-normal">{$Date.ShortMonth} '{$Date.Format(YY)}</span>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </a>--%>
<%--                            <div class="blog-item--content">--%>
<%--                                <a href="$Link" class="text-decoration-none text-dark"><h5 class="poppins mb-3">$Title</h5></a>--%>
<%--                                <p class="desc poppins">{$Abstract}...</p>--%>
<%--                            </div>--%>
<%--                            <% if $Authors %>--%>
<%--                                <% loop $Authors %>--%>
<%--                                    <div class="blog-item--author d-flex">--%>
<%--                                        <div class="author-image">--%>
<%--                                            <% if $ProfileImages %>--%>
<%--                                                <a href="$Link">--%>
<%--                                                    <% loop $ProfileImages.Limit(1) %>--%>
<%--                                                        <img src="$URL" alt="$Title - $SiteConfig.Title">--%>
<%--                                                    <% end_loop %>--%>
<%--                                                </a>--%>
<%--                                            <% end_if %>--%>
<%--                                        </div>--%>
<%--                                        <div class="author-text">--%>
<%--                                            <a href="$Link" class="text-decoration-none">--%>
<%--                                                <p class="author-text--name poppins">$Title</p>--%>
<%--                                            </a>--%>
<%--                                            <p class="author-text--title poppins">$Position</p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                <% end_loop %>--%>
<%--                            <% end_if %>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>
