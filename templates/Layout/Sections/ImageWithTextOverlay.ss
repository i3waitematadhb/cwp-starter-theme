<%--<div class="imageWithTextOverlay-content">--%>
<%--    <div class="imageWithTextOverlay-image">--%>
<%--        <% if $Image %>--%>
<%--            <div class="img-bg" style="background-image: url('{$Image.URL}')"></div>--%>
<%--            <img src="$Image.URL" class="" alt="$Title - $SiteConfig.Title">--%>
<%--        <% else %>--%>
<%--            <div class="img-bg" style="background-image: url('{$resourceURL('themes/starter/images/PlaceholderImage.png')}')"></div>--%>
<%--            <img src="{$resourceURL('themes/starter/images/PlaceholderImage.png')}" class="" alt="$Title - $SiteConfig.Title">--%>
<%--        <% end_if %>--%>
<%--    </div>--%>
<%--    <div class="imageWithTextOverlay-title"><span>$Name</span></div>--%>
<%--    <div class="imageWithTextOverlay-text"><span>$Name</span></div>--%>
<%--    <% if $Content %>$Content<% end_if %>--%>
<%--</div>--%>

<%--<div class="imageWithTextOverlay-content">--%>
<%--    <div class="imageWithTextOverlay-scroll">--%>
<%--    <div class="page page--layout-2">--%>
<%--        <div class="content content--full content--alternate">--%>
<%--            <div class="content__item content__item--wide">--%>
<%--                <div class="content__item-imgwrap"><div class="content__item-img" style="<% if $Image %>background-image: url('{$Image.URL}');<% else %>background-image: url('{$resourceURL('themes/starter/images/PlaceholderImage.png')}');<% end_if %>"></div></div>--%>
<%--                <h2 class="content__item-title content-{$ContentPosition}"><span class="theme-text-gradient font-weight-bold">$Name</span></h2>--%>
<%--                <div class="content__item-description">$Content</div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="imageWithTextOverlay-content">
<%--    <div class="imageWithTextOverlay-content--text {$ContentPosition}">--%>
<%--        <div id="rev-4" class="content__title__inner"><span class="display-1 font-weight-bold theme-text-gradient">{$Name}</span></div>--%>
<%--    </div>--%>
    <div id="rev-5" class="content__title__inner">{$Content}</div>
    <div class="imageWithTextOverlay-content--image">
        <div id="rev-3" class="content__image-wrap">
            <img class="content__image" src="{$Image.URL}" alt="$Name - $SiteConfig.Title"/>
        </div>
    </div>

</div>




