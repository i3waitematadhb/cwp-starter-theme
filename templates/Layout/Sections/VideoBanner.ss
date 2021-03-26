<div class="container-fluid p-0">
    <div class="row no-gutters">
        <div class="col-lg-5 d-flex align-items-center">
            <div class="container">
                <div class="video-content wow animate__animated animate__fadeInLeft">
                    $Content
                </div>
            </div>
        </div>
        <div class="col-lg-7">
            <div class="video-file">
                <div class="btn-play-wrapper">
                    <button class="button-play"><i class="fas fa-play"></i></button>
                </div>
                <% if $Image %>
                    <img src="$Image.URL" class="video-svg" alt="$SiteConfig.Title - Video SVG">
                <% end_if %>
                <% if $VideoThumbnail %>
                    <img src="$VideoThumbnail.URL" class="video-thumbnail" alt="$SiteConfig.Title - $Name">
                <% end_if %>
            </div>
        </div>
    </div>
</div>
