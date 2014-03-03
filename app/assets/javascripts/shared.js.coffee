window.openModal = (jqmClass,content,openCallback) ->
  modalWindow = $("<div class='jqmWindow "+jqmClass+"'></div>");
  modalWindow.html(content);
  $("body").append(modalWindow);
  modalWindow.jqm({
    overlay: 50, 
    onShow: (e) ->
      e.w.show()
      openCallback()
  }).jqmShow();
  return modalWindow;