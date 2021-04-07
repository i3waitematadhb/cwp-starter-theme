<div class="container-fluid p-0">
    <div class="row no-gutters">
        <% include VisibleSections %>
        <section class="project-lists col-lg-12" data-type="project">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-12 pt-8 pb-8" style="background-color: #f5f5f5;">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="project-filters d-flex">
                                        <% if $AllYears %>
                                            <div class="project-filters--item date--filter w-25">
                                                <label for="dropdown-year">Year</label>
                                                <div class="dropdown" id="dropdown-year">
                                                    <button class="btn btn-theme dropdown-toggle" type="button" id="dropdownYear" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All</button>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownYear">
                                                        <button class="dropdown-item" type="button">All</button>
                                                        <% loop $AllYears %>
                                                            <button class="dropdown-item" type="button">$name</button>
                                                        <% end_loop %>
                                                    </div>
                                                </div>
                                            </div>
                                        <% end_if %>
                                        <div class="project-filters--item category--filter w-50">
                                            <label for="dropdown-category">Category</label>
                                            <select class="select-category" name="categories[]" multiple="multiple">
                                                <% loop $VisibleProjectCategories %>
                                                    <option value="$Name">$Name</option>
                                                <% end_loop %>
                                            </select>
                                        </div>
                                        <div class="project-filters-item category--filter w-25">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-lg-12">
                        <div class="paginated-projects">
                            <div class="container-fluid p-0">
                                <div class="row no-gutters"></div>
                            </div>
                        </div>
                        <div class="paginate-action"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<% include PageUtilities %>
