<div class="projectList-content">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <div class="col-md-12">
                <div class="qi-pages">
                    <div class="container-fluid p-0">
                        <div class="row no-gutters">
                            <% loop $QIProjectHolder.Children.Limit($Limit) %>
                                <div class="col-md-3 wow animate__animated animate__fadeInUp" data-wow-delay="0.{$Pos}s">
                                    <a href="$Link">
                                        <div class="project-item">
                                            <div class="project-item__image">
                                                <% if $FeaturedImage %>
                                                    <img src="{$FeaturedImage.URL}" class="" alt="$Title - $SiteConfig.Title">
                                                <% else %>
                                                    <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" alt="$Title - $SiteConfig.Title">
                                                <% end_if %>
                                            </div>
                                            <div class="project-item__content">
                                                <div class="project-title">
                                                    <h4 class="text-white font-weight-bold mb-md-3">$Title</h4>
                                                </div>
                                                <% if $Categories %>
                                                    <div class="project-categories">
                                                        <% loop $Categories %>
                                                            <span class="project-category badge badge-pill badge-light mb-2">$Name</span>
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
                </div>
            </div>
        </div>
    </div>
</div>
