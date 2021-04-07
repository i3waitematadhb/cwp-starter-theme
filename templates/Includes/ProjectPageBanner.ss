<% if $PageBanner %>
    <section id="section-ProjectPageBanner" class="page-section col-lg-12 section-ImageBanner">
        <div class="section-container">
            <div class="container-fluid p-0 align-self-center">
                <div class="row no-gutters">
                    <div class="col-lg-12">
                        <div class="ImageBanner-container section-body">
                            <img src="$PageBanner.URL" alt="$Title - $SiteConfig.Title" class="large parallax-image">
                        </div>
                    </div>
                </div>
            </div>
            <div class="scroll-down">
                <button class="scroll-down--btn animate__animated animate__slow animate__infinite animate__fadeInDown text-white">
                    <i class="fal fa-angle-down h1"></i>
                </button>
            </div>
        </div>
    </section>
<% end_if %>
<% if $PageBannerContent %>
    <section id="section-ProjectPageContent" class="page-section wow animate__animated animate__fadeInUp section-ContentSection col-lg-8 pt-lg-9 pb-lg-5 pl-lg-9 pr-lg-9">
        <div class="section-container">
            <div class="container p-0">
                <div class="row no-gutters">
                    <div class="col-lg-12">
                        <div class="ContentSection-container section-body">
                            $PageBannerContent
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<%--    <section id="section-ProjectPageBannerContent" class="page-section wow animate__animated animate__fadeIn section-ContentSection col-lg-4 p-lg-7" style="background-color:#f7f7f7;">--%>
<%--        <div class="section-container">--%>
<%--            <div class="container-fluid p-0 align-self-center">--%>
<%--                <div class="row no-gutters">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="ContentSection-container section-body">--%>
<%--                            <% if $Categories %>--%>
<%--                                <p><span class="h4 source-sans-pro font-weight-semibold lineheight-2">Categories</span></p>--%>
<%--                                <p>--%>
<%--                                    <% loop $Categories %>--%>
<%--                                        <span class="h5 source-sans-pro font-weight-light lineheight-2 spacing-1">$Title<% if not $Last %>, <% end_if %></span>--%>
<%--                                    <% end_loop %>--%>
<%--                                </p>--%>
<%--                            <% end_if %>--%>
<%--                            <p><span class="lineheight-2">&nbsp;</span></p>--%>
<%--                            <% if $ReadableAuthors %>--%>
<%--                                <p><span class="h4 source-sans-pro font-weight-semibold lineheight-2">Author/s</span></p>--%>
<%--                                <p><span class="h5 source-sans-pro font-weight-light lineheight-2 spacing-1"><% loop $ReadableAuthors %>$Name<% if not $Last %>, <% end_if %><% end_loop %></span></p>--%>
<%--                            <% end_if %>--%>
<%--                            <p><span class="lineheight-2">&nbsp;</span></p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<% end_if %>
