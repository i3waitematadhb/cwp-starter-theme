<% if $Authors %>
<section id="section-BlogFooter" class="page-section section-BlogFooter col-lg-12">
    <div class="blog-footer">
        <div class="container pl-lg-7 pr-lg-7 pb-lg-7">
            <div class="row pt-lg-4">
                <div class="col-lg-12">
                    <div class="blog-footer--share-links pb-lg-4 text-right">
                        <ul class="list-unstyled clearfix">
                            <li class=""><span class="font-weight-semibold text-black-50">Share this</span></li>
                            <li class="share-link linkedin"><span class="font-weight-bold"><i class="fab fa-linkedin-in"></i></span></li>
                            <li class="share-link twitter"><span class="font-weight-bold"><i class="fab fa-twitter"></i></span></li>
                            <li class="share-link facebook"><span class="font-weight-bold"><i class="fab fa-facebook-f"></i></span></li>
                            <li class="share-link mail"><span class="font-weight-bold"><i class="fas fa-envelope"></i></span></li>
                        </ul>
                    </div>
                </div>
                <% loop $Authors %>
                    <div class="col-lg-12">
                        <div class="blog-footer--authors pt-lg-5">
                            <div class="author-details d-flex align-items-center">
                                <% if $ProfileImages %><% loop $ProfileImages.Limit(1) %><img src="$URL" alt="$Title - Profile Image"><% end_loop %><% end_if %>
                                <p class="author-info">
                                    <a href="$Link"><span class="font-weight-bold">$Title</span></a><span> &mdash; $Position</span><br>
                                    <% if $Blob %>
                                        <span class="text-black-50 pt-3 d-block font-weight-normal lineheight-2">{$Blob}</span>
                                    <% end_if %>
                                </p>
                            </div>
                        </div>
                    </div>
                <% end_loop %>
            </div>
        </div>
    </div>
</section>
<% end_if %>
