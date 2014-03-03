  window.modalOpened = ->

    setDateToRailsDatetime = (identifier,d) ->
      $("#"+identifier+"_1i").val d.getFullYear()
      $("#"+identifier+"_2i").val d.getMonth()
      $("#"+identifier+"_3i").val d.getDate()
      $("#"+identifier+"_4i").val ('0'+d.getHours()).slice(-2)
      $("#"+identifier+"_5i").val ('0'+d.getMinutes()).slice(-2)

    getDateFromRailsDatetime = (identifier) ->
      d = new Date();
      d.setYear( $("#"+identifier+"_1i").val() )
      d.setMonth( $("#"+identifier+"_2i").val() )
      d.setDate( $("#"+identifier+"_3i").val() )
      d.setHours( $("#"+identifier+"_4i").val(), $("#"+identifier+"_5i").val() )
      d.setMilliseconds( 0 )
      return d;

    $("#submit_effort_btn").click( (e) ->
      fromDate = getDateFromRailsDatetime("effort_from")
      toDate = getDateFromRailsDatetime("effort_to")
      if(fromDate >= toDate)
        e.preventDefault()
        msgContainer = $("#message span",".jqmWindow")
        msgContainer.text("Dates are the same or 'to' is before 'from'")
        foCallback = -> msgContainer.html("&nbsp;"); msgContainer.show();
        toCallback = -> msgContainer.fadeOut foCallback
        setTimeout toCallback, 3000
    )

    $("#subtract_hour_btn").click( (e) ->
      e.preventDefault()
      fromDate = getDateFromRailsDatetime("effort_from")
      fromDate.setHours(fromDate.getHours() - 1)
      setDateToRailsDatetime("effort_from",fromDate)
    )