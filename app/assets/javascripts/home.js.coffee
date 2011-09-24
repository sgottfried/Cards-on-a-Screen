# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

stop_drag_handler = (event, ui) -> 
	console.log "id", ui.helper[0].children[0].innerHTML
	console.log "left: ", ui.position.left, "top: ", ui.position.top
	xhr = $.get "card/moved", id: ui.helper[0].children[0].innerHTML, top: ui.position.top, left: ui.position.left
	xhr.error( -> alert "Server isn't responding. Try reloading.")

new_card_handler = ->
	console.log "making a new card"
	xhr = $.get "card/create", {left: 100, top: 150}
	xhr.success((data) -> 
		$("#cards").append(data)
		setup_card_interactions()
	)
	xhr.error( -> alert "Server isn't responding. Try reloading.")

edit_card_handler = (event) ->
	current_text = $(event.target).children(".text").html()
	$(event.target).children(".text").hide()
	$(event.target).children(".text").after("<textarea>" + current_text + "</textarea>")
	$(event.target).children("textarea").focus()

textarea_blur_handler = (event) ->
	current_text = $(event.target).val()
	
	id = $(event.target).parent().children(".database_id").html()
	xhr = $.get "card/text", id: id, text: current_text
	xhr.error( -> alert "Server isn't responding. Try reloading.")
	xhr.success( (data) ->
		$(event.target).parent().children(".text").html(data)
		$(event.target).parent().children(".text").show()
		$(event.target).remove()
	)
	
delete_area_drop_handler = (event, ui) ->
	xhr = $.get "card/delete", id: $(ui.helper).children(".database_id").html()
	xhr.error( -> alert "Server isn't responding. Try reloading.")
	xhr.success( -> $(ui.helper).remove())


setup_card_interactions = ->
	$('.card').draggable 
		stop: stop_drag_handler

$ ->
	$('#new_card_button').click new_card_handler
	
	$("#delete_area").droppable({
		drop: delete_area_drop_handler,
		tolerance: "touch",
		hoverClass: "droppable-hover-state"
	})
	$("#cards").delegate("textarea", "blur", textarea_blur_handler)
	$('#cards').delegate(".card", "dblclick", edit_card_handler)
	
	setup_card_interactions()