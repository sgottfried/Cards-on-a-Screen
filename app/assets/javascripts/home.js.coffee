# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

stop_drag_handler = (event, ui) -> 
	console.log "id", ui.helper[0].children[0].innerHTML
	console.log "left: ", ui.position.left, "top: ", ui.position.top
	$.get "card/moved", id: ui.helper[0].children[0].innerHTML, top: ui.position.top, left: ui.position.left




$ ->
	$('.card').draggable 
		stop: stop_drag_handler
	