<% if $CurrentUser %>
    <div class="main-content">
        <div class="container pt-md-5 pb-md-5 pt-2 pb-2">
            <div class="row table-filters filters">
                <div class="col-md-2">
                    <div class="filter-item filter--memberType-selector" data-type="memberType">
                        <div class="dropdown">
                            <h6>Member Type:</h6>
                            <button class="btn dropdown-toggle text-left" type="button" id="memberType-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <span class="ml-0" data-id="">Select type</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="memberType-dropdown">
                                <% if $AllVisibleMemberType %>
                                    <% loop $AllVisibleMemberType %>
                                       <a class="dropdown-item" role="button"><span data-id="{$ID}">{$Name}</span></a>
                                    <% end_loop %>
                                <% end_if %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="filter-item filter--period-selector" data-type="period">
                        <div class="dropdown">
                            <h6>Period:</h6>
                            <button class="btn dropdown-toggle text-left" type="button" id="period-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <span class="ml-0" data-id="">Select Period</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="period-dropdown"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="filter-item filter--module-selector" data-type="module">
                        <div class="dropdown">
                            <h6>Module:</h6>
                            <button class="btn dropdown-toggle text-left" type="button" id="module-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               <span class="ml-0" data-id="">Select Module</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="module-dropdown"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container pt-2 pb-5">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-container">
                        <table id="tableAdmin" class="display nowrap" style="width:100%">
                            <thead>
                                <tr>
    <%--                                <th class="main-header">Module</th>--%>
    <%--                                <th class="main-header">PracticeID</th>--%>
    <%--                                <th class="main-header">PHO</th>--%>
    <%--                                <th class="main-header">Review_Date</th>--%>
    <%--                                <th class="main-header">Ethnicity</th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
    <%--                                <td>Tiger Nixon</td>--%>
    <%--                                <td>System Architect</td>--%>
    <%--                                <td>Edinburgh</td>--%>
    <%--                                <td>61</td>--%>
    <%--                                <td>2011/04/25</td>--%>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<% end_if %>
