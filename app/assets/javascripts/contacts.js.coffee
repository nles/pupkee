# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->

  allTasks = $(".contact_task_id").html();

  setCustomers = (target) ->
    customerSelect = $("#contact_customer_id")
    pleaseSelect = $("option:first",$("<select>"+allTasks+"</select>")).outerHTML();
    checkChange(customerSelect,target,pleaseSelect)

  checkChange = (customerSelect,target,pleaseSelect) ->
    target.each ->
      taskSelect = $(".contact_task_id",@);
      customer = $(":selected", customerSelect).text();
      escapedCustomer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
      options = $(allTasks).filter("optgroup[label='#{escapedCustomer}']").html();
      
      if(options)
        options = pleaseSelect+options;
        taskSelect.parent().show();
        taskSelect.html(options);
      else
        taskSelect.html("<option value=''>Select a customer first</option>");

  # customer change event
  $("#contact_customer_id").change (e) ->
    if($("#current_tasks .task_line").length > 0 || $("#new_tasks .task_line").length > 1)
      if(confirm("All tasks will reset when you change the customer. Continue?"))
        i = 0;
        $("#new_tasks .task_line").each ->
          $(this).remove() if i > 0
          i++
        $("#current_tasks .task_line").remove()
        setCustomers($("#new_tasks .task_line"))
      else
        e.preventDefault();
    else
      setCustomers($("#new_tasks .task_line"))


  # first run
  setCustomers($("#new_tasks .task_line"))


  cLine = $("#new_tasks .task_line").html()
  $("#add_new_task_btn").click ->
    $("#new_tasks").append("<div class='task_line'>"+cLine+"</div>")
    setCustomers($("#new_tasks .task_line:last"))

  $(".remove_task_btn").click ->
    $(this).closest(".task_line").remove();
