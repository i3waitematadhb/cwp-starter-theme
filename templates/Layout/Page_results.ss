<div class="content search-results col-lg-12" style="background-image: url('{$resourceURL('themes/starter/images/DefaultBg.png')}');">
    <div class="container pt-lg-10 pb-lg-10">
        <div class="row">
            <section class="col-lg-12">
                <div class="pb-2 mt-4 mb-4 pb-3 border-bottom">
                    <p class="theme-text-gradient display-5 font-weight-bold">$Title.XML</p>
                </div>
                $SearchForm
                <% if $Query %>
                    <div class="page-summary clearfix mb-6 mt-6">
                        <% if $Results %>
                            <% if $Original %>
                                <div class="row search-results-no-result">
                                    <div class="col-md-12">
                                        <div class="alert alert-warning" role="alert">
                                            <%t CWP_Search.Original "No search results were found matching <strong>{original}</strong>." original=$Original %>
                                        </div>
                                    </div>
                                </div>
                            <% end_if %>
                            <div class="row">
                                <div class="col-lg-12 text-left search-results-results-message">
                                    <p class="lead font-weight-semibold" tabindex="-1">
                                        <% if $Original %>
                                            <%t CWP_Search.ShowingResultsInsteadFor 'Showing results for "{query}" instead' query=$Query.XML %>
                                        <% else %>
                                            <%t CWP_Search.ShowingResultsFor 'Showing results for "{query}"' query=$Query.XML %>
                                        <% end_if %>
                                    </p>
                                </div>
                                <div class="col-lg-12 text-left search-results-results-page">
                                    <p class="text-muted">
                                        <%t CWP_Search.Pages "Displaying page {current} of {total}" current=$Results.CurrentPage total=$Results.TotalPages %>
                                    </p>
                                </div>
                            </div>

                        <% else %>
                            <div class="row search-results-no-result">
                                <div class="col-md-12">
                                    <div class="alert alert-warning" role="alert">
                                        $NoSearchResults.XML
                                    </div>
                                </div>
                            </div>
                        <% end_if %>
                    </div>
                    <% if $Results %>
                        <hr>
                        <div class="results listing row">
                            <% loop $Results %>
                                <article class="result listing__item mb-4 mt-4 col-lg-12" data-highlight="$Up.Query.ATT">
                                    <div class="title">
                                        <p class="h5">
                                            <a href="$Link" title="$Title"><span class="font-weight-medium lineheight-1">$Title</span></a>
                                        </p>
                                    </div>
                                    $Content.Summary
                                </article>
                                <div class="col-lg-12">
                                    <hr>
                                </div>
                            <% end_loop %>
                        </div>
                        <% with $Results %>
                             <% include Pagination %>
                         <% end_with %>
                     <% end_if %>
                 <% else %>
                     <div class="row search-results__empty-search">
                         <div class="col-md-12">
                             <div class="alert alert-warning" role="alert">
                                 $EmptySearch
                             </div>
                        </div>
                    </div>
                <% end_if %>
            </section>
        </div>
    </div>
    <% include PageUtilities %>
</div>
