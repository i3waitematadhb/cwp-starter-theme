<div class="blogList-content">
    <div class="container-fluid">
        <div class="row">
            <% if $NewsPage %>
                <% loop $NewsPage %>
                    <div class="col-xl-3 col-lg-6 wow animate__animated animate__fadeInUpBig" data-wow-delay="0.{$Pos}s">
                        <div class="blog-item">
                            <a href="$Link">
                                <div class="blog-item--image">
                                    <% if $Image %>
                                        <img src="{$Image.URL}" alt="$Title - $SiteConfig.Title" class="image">
                                    <% else %>
                                        <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title" class="image">
                                    <% end_if %>

                                    <div class="teaser-date">
                                        <div class="teaser-date--inner source-sans-pro">
                                            <span class="day">$Date.DayOfMonth</span>
                                            <span class="month">{$Date.ShortMonth} '{$Date.Format(YY)}</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="blog-item--content">
                                <a href="$Link" class="text-decoration-none text-dark"><h3 class="source-sans-pro">$Title</h3></a>
                                <p class="desc source-sans-pro">{$Abstract}...</p>
                            </div>
                            <% if $Authors %>
                                <% loop $Authors %>
                                    <div class="blog-item--author d-flex">
                                        <div class="author-image">
                                            <% if $ProfileImages %>
                                                <a href="$Link">
                                                    <% loop $ProfileImages.Limit(1) %>
                                                        <img src="$URL" alt="$Title - $SiteConfig.Title">
                                                    <% end_loop %>
                                                </a>
                                            <% end_if %>
                                        </div>
                                        <div class="author-text">
                                            <a href="$Link" class="text-decoration-none">
                                                <p class="author-text--name source-sans-pro">$Title</p>
                                            </a>
                                            <p class="author-text--title source-sans-pro">$Position</p>
                                        </div>
                                    </div>
                                <% end_loop %>
                            <% end_if %>
                        </div>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>
