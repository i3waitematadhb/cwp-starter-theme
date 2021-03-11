<% if $VisibleCategoriesBySelectedYear %>
<div class="container-fluid p-0">
    <div class="row">
        <% loop $VisibleCategoriesBySelectedYear %>
            <div class="col-lg-6 pb-5 wow animate__animated animate__fadeInUp category-item">
                <div class="category-item__content">
                    $Content
                </div>
            </div>
        <% end_loop %>
    </div>
</div>
<% end_if %>
