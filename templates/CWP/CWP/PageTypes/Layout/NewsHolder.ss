<% include VisibleSections %>
<div class="container-fluid pl-lg-10 pr-lg-10 pb-lg-10 pt-lg-6">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-breadcrumbs">$Breadcrumbs</div>
        </div>
    </div>
    <div class="row pt-lg-10 no-gutters">
        <aside class="col-lg-12 pb-lg-5 blog-filter justify-content-between d-flex">
<%--            offset-lg-1 sidebar--%>
<%--            <h2 class="h3"><%t CWP_NewsEvents.FILTERS "Filters" %></h2>--%>
            <% if $UpdateTagsWithLinks %>
                <% include UpdateTags %>
            <% end_if %>
            <% include DateRange %>
            <% if $AvailableMonths %>
                <% include AvailableMonths ControllerName=$ClassName %>
            <% end_if %>
        </aside>
        <div class="col-lg-12">
            <% if $Content.RichLinks %>
                $Content.RichLinks
            <% else %>
                $Content
            <% end_if %>

            <% include NewsFilterContext %>

            <section class="listing">
                <% if $FilteredUpdates %>
                    <% include FilteredUpdates ControllerName=$ClassName %>
                <% else %>
                    <article>
                        <p><%t CWP_FilteredUpdates.NoNews "No news" %></p>
                    </article>
                <% end_if %>
            </section>
        </div>
    </div>
</div>

<% include PageUtilities %>

