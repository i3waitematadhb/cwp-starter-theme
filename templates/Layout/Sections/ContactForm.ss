<div class="contacForm-content">
    <div class="container-fluid p-0">
        <div class="row">
            <div class="col-lg-6">
                <div class="contactForm-image">
                    <% if $Image %>
                        <img src="$Image.URL" alt="$SiteConfig.Title - Contact Form">
                    <% end_if %>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="contactForm-text">
                    $FeedbackForm
                </div>
            </div>
        </div>
    </div>
</div>
