# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

stop_drag_handler = (event, ui) -> 
	console.log "id", ui.helper[0].children[0].innerHTML
	console.log "left: ", ui.position.left, "top: ", ui.position.top
	$.get "card/moved", id: ui.helper[0].children[0].innerHTML, top: ui.position.top, left: ui.position.left


new_card_handler = ->
	console.log "making a new card"
	xhr = $.get "card/create", {left: 100, top: 150}
	xhr.success((data) -> 
		$("#cards").append(data)
		$("#cards .card").last().draggable() 
	)


$ ->
	$('.card').draggable 
		stop: stop_drag_handler
	
	$('#new_card_button').click new_card_handler