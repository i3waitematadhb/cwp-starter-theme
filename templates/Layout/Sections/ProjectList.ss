<div class="projectList-content">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
            <% if $VisibleProjectListItems %>
                <% loop $VisibleProjectListItems %>
                    <div class="{$Top.widthSize($Up.NumPerRow)}<% if $Animation != 'None' %> wow animate__animated {$Animation}<% end_if %>">
                        <% if $CollectionPage %>
                            <a href="$CollectionPage.Link">
                                <div class="project-item">
                                    <div class="project-item__image">
                                        <% if $CollectionPage.FeaturedImage %>
                                            <img src="{$CollectionPage.FeaturedImage.URL}" class="" alt="$Title - $SiteConfig.Title">
                                        <% else %>
                                            <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" class="" alt="$Title - $SiteConfig.Title">
                                        <% end_if %>
                                    </div>
                                    <div class="project-item__content">
                                        <div class="project-title">
                                            <h3 class="text-white font-weight-bold mb-md-3">$CollectionPage.Title</h3>
                                        </div>
                                        <% if $CollectionPage.Categories %>
                                            <div class="project-categories">
                                                <% loop $CollectionPage.Categories %>
                                                    <span class="project-category badge badge-pill badge-light">$Name</span>
                                                <% end_loop %>
                                            </div>
                                        <% end_if %>
                                    </div>
                                </div>
                            </a>
                        <% end_if %>
                    </div>
                <% end_loop %>
            <% end_if %>
        </div>
    </div>
</div>
