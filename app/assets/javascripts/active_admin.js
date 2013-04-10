//= require active_admin/base
// require active_admin/application
// require jquery       
// require jquery-ui          
// require jquery_ujs  
//= require bootstrap
//= require herb_form

function remove_fields(link) {
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regex = new RegExp("new_" + association, "g");
    $(link).parent().after(content.replace(regex, new_id));
    var modal_name = '#new-' + association + '-fields';
    var table_name = '#' +  association + '-table';
    $(modal_name).modal('show');
    fieldsUI.init(modal_name, table_name);
}



$(function() {
    $( "#accordion" ).accordion();
 });