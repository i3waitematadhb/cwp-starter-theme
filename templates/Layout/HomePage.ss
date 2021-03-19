<div class="home-page">
    <div class="container-fluid p-0">
        <div class="row no-gutters">
             <div class="col-md-12">
                <% if $VisibleSliderButtons %>
                    <div class="navigation-container">
                        <div class="navigation-items d-flex justify-content-center">
                            <% loop $VisibleSliderButtons %>
                                <div class="navigation-item">
                                    <button class="nav-button <% if $Pos == 1 %>active<% end_if %>" data-id="{$SliderContent.ID}" data-name="{$Name}">
                                        <% if $Image %>
                                            <img src="$Image.URL" class="nav-img" alt="$Name">
                                            <p>$Name</p>
                                        <% end_if %>
                                    </button>
                                </div>
                            <% end_loop %>
                        </div>
                    </div>
                <% end_if %>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <% if $Content %>$Content<% end_if %>
                   <% if $VisibleSliderContents %>
                    <div class="owl-carousel owl-theme">
                        <% loop $VisibleSliderContents %>
                            <div class="slide-content" id="{$ID}">
                                $Content
                                <% if $VisibleVideoTabs %>
                                    <!-- Tab links -->
                                    <div class="tab">
                                        <% loop $VisibleVideoTabs %>
                                            <button class="tablinks h5<% if $Pos == 1 %> active<% end_if %>" id="tab{$ID}" data-id="{$ID}">{$Name}</button>
                                        <% end_loop %>
                                    </div>
                                     <!-- Tab content -->
                                    <% loop $VisibleVideoTabs %>
                                        <div id="tabcontent{$ID}" class="tabcontent" <% if $Pos == 1 %>style="display: block;"<% end_if %>>
                                            <div class="p-md-4 p-4"><h3>{$Name}</h3></div>
                                            <% if $Video %>
                                                <button class="btn-play"><i class="fal fa-play-circle"></i></button><video <% if $VideoThumbnail %>poster="{$VideoThumbnail.URL}"<% end_if %> class="video-element"><source src="$Video.URL" type="video/mp4"></video>
                                            <% end_if %>
                                            <% if $VideoLink %>
                                                $VideoLink.RAW
                                            <% end_if %>
                                        </div>
                                    <% end_loop %>
                                <% end_if %>
                            </div>
                        <% end_loop %>
                    </div>
                <% end_if %>
            </div>
        </div>
    </div>
 </div>
<% include PageUtilities %>
