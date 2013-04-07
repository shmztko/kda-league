# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $(".footable").footable createDetail: (element, data) ->
    i = 0
    while i < data.length
      group = data[i].group
      if group == "control"
        element.append data[i].display
      else
        if element.children("dl." + group).length == 0
          element.append("<dl>")
          element.children("dl:last").addClass(group)
          element.children("dl." + group).append "<dt>" + data[i].group + "</dt>"
          element.children("dl." + group).append "<dd>" + data[i].display + "</dd>"
        else
          element.children("dl." + group).append "<dd>" + data[i].display + "</dd>"
      i++