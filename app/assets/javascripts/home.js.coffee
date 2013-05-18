# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
	$("#hero-photo").backstretch('assets/hero-photo.jpg')

	$(".scroll").click (e) ->
	  e.preventDefault()
	  id = $(this).attr('href')
	  $("html, body").animate
	    scrollTop: $(id).offset().top
	  , 500

	$('.flash').click ->
		$(this).remove()

	$('.flash').delay(2000).fadeOut()