// Set up the UI/UX for the form screens.  This object sets up all the functionality we need to:
//  1.  Bind to the "click" event of the "#addButton" on the modal form.
//  2.  Append data from the modal form to the table.
//  3.  Hide the modal form when the user is done entering data.
//
// If any other events need to be wired up, the init function would be the place to put them.
var fieldsUI = {
    init: function(modal_name, table_name) {
        // Configuration for the jQuery validator plugin:
        // Set the error messages to appear under the element that has the error.  By default, the
        // errors appear in the all-too-familiar bulleted-list.
        // Other configuration options can be seen here:  https://github.com/victorjonsson/jQuery-Form-Validator
        var validationSettings = {
            errorMessagePosition : 'element'
        };

        // Run validation on an input element when it loses focus.
        //$(modal_name).validateOnBlur();

        $('#addButton').on('click', function(e) {
            // If the form validation on our Pilots modal "form" fails, stop everything and prompt the user
            // to fix the issues.
            //var isValid = $(modal_name).validate(false, validationSettings);
            //if(!isValid) {
            //    e.stopPropagation();

            //    return false;
            //}

            formHandler.appendFields(modal_name, table_name);
            formHandler.hideForm();
        });
    }
};

// Configuration for the Add/Edit Ship screen's functionality:
//  formId:  The ID of the <FORM> that contains the input fields that need to be captured and appended to the table of Pilots.
//  tableId:  The ID of the <TABLE> that represents the Pilots assigned to fly a particular ship.
//  inputFieldClassSelector:  The CSS class that is assigned to all the data entry/input fields that need to be collected
//      for appending to th Pilots table (and ultimately for saving to the database).
//  getTBodySelector:  A VERY simple method that concatenates the cfg.tableId and " tbody" to build the selector we need
//      to identify the <TABLE> where we'll be appending rows.
var cfg = {
    formId: '#new-pilot-fields',
    tableId: '#pilots-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function(table_name) {
        return table_name + ' tbody';
    }
};

// Provides functionality to append new rows to the Pilots table and hide the modal form for adding new Pilots.
// NOTE:  The "appendFields" function depends on the rowBuilder to handle building the HTML for the new row.
var formHandler = {
    // Public method for adding a new row to the table.
    appendFields: function (modal_name, table_name) {
        // Get a handle on all the input fields in the form and detach them from the DOM (we'll attach them later).
        var inputFields = $(modal_name + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();

        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(table_name), inputFields);

        // Add the "Remove" link to the last cell.
        rowBuilder.link.appendTo($('tr:last td:last'));
    },

    // Public method for hiding the data entry fields.
    hideForm: function(modal_name) {
        $(modal_name).modal('hide');
    }
};

// Provides functionality for building the HTML that represents a new <TR> for the Pilots table.
var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this Pilot.'
    }).append($('<i>', { class: 'icon-remove' }));

    // A private method for building a <TR> w/the required data.
    var buildRow = function(tableBody, fields) {
        
        var newRow = row.clone();
        //var newRow = $(tableBody).find("tr:last").clone();

        var $oldRow = $(fields).map(function() {
            $(this).removeAttr('class');
            var col = $('<td/>').append($(this));
            return col[0];
            //return $('<td/>')[0].append($(this));
        })

        newRow.append($oldRow);

        return newRow;
    }


    // A public method for building a row and attaching it to the end of a <TBODY> element.
    var attachRow = function(tableBody, fields) {
        var row = buildRow(tableBody, fields);
        $(row).appendTo($(tableBody));
    }

    // Only expose public methods/properties.
    return {
        addRow: attachRow,
        link: link
    }
}();