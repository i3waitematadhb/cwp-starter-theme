<% if $AllRelatedProjects %>
    <div class="relatedProjects-content">
        <div class="owl-carousel owl-theme">
            <% loop $AllRelatedProjects %>
                <div class="relatedProjects-item wow animate__animated animate__fadeInUpBig" data-wow-delay="0.{$Pos}s">
                    <a href="$Link">
                        <div class="project-item">
                            <div class="project-item__image">
                                <% if $FeaturedImage %>
                                    <img src="{$FeaturedImage.URL}" class="" alt="$Title - $SiteConfig.Title">
                                <% else %>
                                    <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" class="" alt="$Title - $SiteConfig.Title">
                                <% end_if %>
                            </div>
                            <div class="project-item__content">
                                <div class="project-title">
                                    <h5 class="text-white font-weight-semibold mb-md-3">$Title</h5>
                                </div>
                                <% if $Categories %>
                                    <div class="project-categories">
                                        <% loop $Categories %>
                                            <span class="project-category badge badge-pill badge-light m-1">$Title</span>
                                        <% end_loop %>
                                    </div>
                                <% end_if %>
                            </div>
                        </div>
                    </a>
                </div>
            <% end_loop %>
        </div>
    </div>
<% end_if %>
