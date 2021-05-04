<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% include VisibleSections %>
        <section class="resources-filters col-lg-12 pt-8 pb-8" style="background-color: #f5f5f5;">
            <div class="container">
                <div class="row">
                    <% if $VisibleFilters %>
                        <input type="hidden" value="$ID" name="page-id" id="page-id">
                        <% loop $VisibleFilters %>
                            <div class="col-lg-4 resources-filters--item">
                                <div class="filter-content">
                                    <label for="dropdown-{$ID}" class="d-block text-dark">$Name</label>
                                    <% if $VisibleFilterItems %>
                                        <select class="resources-categories" name="category-{$ID}[]" multiple="multiple" id="dropdown-{$ID}">
                                            <% loop $VisibleFilterItems %>
                                                <option value="$Name">$Name</option>
                                            <% end_loop %>
                                        </select>
                                    <% end_if %>
                                </div>
                            </div>
                        <% end_loop %>
                    <% end_if %>
                    <div class="col-lg-12 pt-6">
                        <div class="paginated-resources grid"></div>
                        <div class="paginate-action"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<% include PageUtilities %>
