<div class="form-group row <% if $Type != "Separator" %>mb-4<% end_if %>" data-type="$Type">
    <% if $Type != "Title" && $Type != "Text" && $Type != "Separator" %>
        <label class="form-label col-sm-12 mb-md-3" data-id="$ID">$Label</label>
    <% end_if %>
    <div class="col-md-12">
<%--    <% if $Type == 'Separator' %>col-md-12<% else %><% if $Type != 'Title' && $Type != 'Text' %>col-md-12 <% else %>col-md-12<% end_if %><% end_if %>--%>
        <% if $Type == "Title" %>
            <div class="form-title"><span>$Name</span></div>
        <% end_if %>
        <% if $Type == "Text" %>
            <div class="form-freetext">$TextContent</div>
        <% end_if %>

        <% if $Type == 'Separator' %>
            <hr>
        <% end_if %>

        <% if $Type == 'Textbox' %>
            <input type="text" class="form-control">
            <div class="invalid-feedback">Please provide a valid input.</div>
        <% end_if %>

        <% if $Type == 'UserAccount' %>
            <input type="text" class="form-control" value="{$CurrentUser.FirstName} {$CurrentUser.LastName}" disabled>
        <% end_if %>

        <% if $Type == 'Date' %>
            <input type="text" class="form-control" name="singledatepicker">
            <div class="invalid-feedback">Please provide a valid input.</div>
        <% end_if %>

        <% if $Type == 'RadioButton' %>
            <div class="radio-selector" tabindex="-1">
                <% loop $VisibleRadioFieldItems %>
                    <div class="radio-item">
                        <input type="radio" name="{$Up.ID}<% if $Up.Number %>{$Up.Number}<% end_if %>-mcs" value="$Title" class="styled-radio" id="radio-{$ID}<% if $Up.Number %>{$Up.Number}<% end_if %>">
                        <label for="radio-{$ID}<% if $Up.Number %>{$Up.Number}<% end_if %>" class="styled-radio--label"><span>
                            <svg width="12px" height="9px" viewbox="0 0 12 9"><polyline points="1 5 4 8 11 1"></polyline></svg></span><span>$Title</span></label>
                    </div>
                <% end_loop %>
            </div>
            <div class="invalid-feedback">This field is required.</div>
        <% end_if %>

        <% if $Type == 'Checkbox' %>

        <% end_if %>

        <% if $Type == 'Dropdown' %>
            <div class="dropdown-selector">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <% loop $VisibleDropdownFieldItems %>
                        <% if $First %>
                            <span data-id="{$ID}">$Name</span>
                        <% end_if %>
                    <% end_loop %>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <% loop $VisibleDropdownFieldItems %>
                        <a class="dropdown-item" href="#"><span data-id="{$ID}">$Name</span></a>
                    <% end_loop %>
                </div>
            </div>
        <% end_if %>

        <% if $Type == 'Ethnicity' %>
            <% if $VisibleEthnicityItems %>
                <div class="dropdown-selector dropdown-ethnicity">
                    <a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <% loop $VisibleEthnicityItems %>
                            <% if $First %>
                                <span data-id="{$ID}">$Name</span>
                            <% end_if %>
                        <% end_loop %>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <% loop $VisibleEthnicityItems %>
                            <a class="dropdown-item" href="#"><span data-id="{$ID}">$Name</span></a>
                        <% end_loop %>
                    </div>
                </div>
            <% end_if %>
        <% end_if %>

        <% if $Type == "MultipleTextbox" %>
            <div class="multiple-textbox row" tabindex="-1">
                <% loop $VisibleMultiTextboxItems %>
                    <div class="textbox-item col-md-6" data-type="<% if $Type == "compare" %>compare<% end_if %>">
                        <label class="font-weight-bold theme-text">$Name</label>
                        <% if $Type == "number" %>
                            <input type="number" class="form-control">
                        <% else_if $Type == "compare" %>
                            <input type="number" class="form-control" data-type="$CompareType">
                        <% else %>
                            <input type="text" class="form-control">
                        <% end_if %>
                        <div class="invalid-feedback">Please provide a valid input.</div>
                    </div>
                <% end_loop %>
            </div>
        <% end_if %>

<%--        <% if $Type == "MultipleTextbox" %>--%>
<%--            <div class="multiple-textbox row" tabindex="-1">--%>
<%--                <% loop $VisibleMultiTextboxItems %>--%>
<%--                    <div class="textbox-item col-md-6" data-type="<% if $FieldType == "Number Comparison" %>compare<% end_if %>">--%>
<%--                        <label class="font-weight-bold theme-text">$Title</label>--%>
<%--                        <% if $FieldType == "Number" %>--%>
<%--                            <input type="number" class="form-control">--%>
<%--                        <% else_if $FieldType == "Number Comparison" %>--%>
<%--                            <input type="number" class="form-control" data-type="$FieldCompareType">--%>
<%--                        <% else %>--%>
<%--                            <input type="text" class="form-control">--%>
<%--                        <% end_if %>--%>
<%--                        <div class="invalid-feedback">Please provide a valid input.</div>--%>
<%--                    </div>--%>
<%--                <% end_loop %>--%>
<%--            </div>--%>
<%--        <% end_if %>--%>
        <% if $Type == 'Textarea' %>
            <textarea class="form-control form-textarea" rows="7"></textarea>
            <div class="invalid-feedback">Please provide a valid input.</div>
        <% end_if %>
    </div>
</div>
