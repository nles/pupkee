# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  check_change = (that,line,contacts,please_select) ->
    
    contact_select = $(".contact_select", line);
    customer = $(":selected", that).text();
    escaped_customer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(contacts).filter("optgroup[label='#{escaped_customer}']").html();
    #console.log(contacts);
    
    if(options)
      options = please_select+options;
      contact_select.parent().show();
      contact_select.html(options);
    else
      contact_select.parent().hide();

  $(".customer_select").each ->
    wrapper = $(@).parent()
    line = wrapper.parent();
    
    wrapper.show();
    
    contact_select = $(".contact_select", line);
    contacts = contact_select.html();
    please_select = $("option:first",contact_select).outerHTML();
    console.log(please_select);

    $(@).change ->
      check_change(@,line,contacts,please_select)

    check_change(@,line,contacts,please_select)