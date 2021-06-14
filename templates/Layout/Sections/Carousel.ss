<div class="carousel-content">
    <% if $VisibleCarouselItems %>
        <div class="owl-carousel owl-theme">
            <% loop $VisibleCarouselItems %>
                <div class="carouselContent-item wow animate__animated animate__fadeInUpBig" data-wow-delay="0.{$Pos}s">
                    <div class="card">
                        <div class="card-body<% if $Page.Date %> d-flex align-items-end<% end_if %>">
                            <% if $Page %>
                                <a href="$Page.Link" class="card-link<% if $Page.Date %> w-90<% end_if %>">
                                <h5 class="card-title poppins font-weight-semibold theme-text-gradient mb-0">$Name</h5>
                                </a>
                                <% if $Page.Date %>
                                    <div class="card-date">
                                        <p class="text-center poppins"><span class="d-block font-weight-light">{$Page.Date.ShortMonth}</span><span class="font-weight-bold text-brand d-block">{$Page.Date.DayOfMonth}</span><span class="d-block font-weight-light">{$Page.Date.Year}</span></p>
                                    </div>
                                <% end_if %>
                            <% else %>
                                <% if $Content %>
                                    $Content
                                <% end_if %>
                            <% end_if %>
                        </div>
                        <div class="card-image">
                            <% if $Page %>
                            <a href="$Page.Link">
                                <% if $Page.Image || $Page.FeaturedImage %>
                                    <img src="{$Page.Image.URL}{$Page.FeaturedImage.URL}" alt="{$Page.Title} - $SiteConfig.Title">
                                <% else %>
                                    <% if $Image %>
                                        <img src="$Image.URL" alt="{$Title} - $SiteConfig.Title">
                                    <% else %>
                                        <img src="$resourceURL('themes/starter/dist/images/PlaceholderImage.png')" alt="{$Title} - $SiteConfig.Title">
                                    <% end_if %>
                                <% end_if %>
                            <% else %>
                                <% if $Image %>
                                    <img src="$Image.URL" alt="{$Title} - $SiteConfig.Title">
                                <% else %>
                                    <img src="$resourceURL('themes/starter/dist/images/PlaceholderImage.png')" alt="{$Title} - $SiteConfig.Title">
                                <% end_if %>
                            <% end_if %>
                            <% if $Page %>
                                <button class="theme-button-circle theme-button-circle--light rounded-circle btn-no-outline"><i class="fal fa-long-arrow-right" aria-hidden="true"></i></button>
                            </a>
                            <% end_if %>
                        </div>
                    </div>
                </div>
            <% end_loop %>
        </div>
    <% end_if %>
</div>
