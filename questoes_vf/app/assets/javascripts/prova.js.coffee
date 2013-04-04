# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('#prova_disponivel_data_inicio').datepicker({
		language: 'pt-BR'
	})
	
	$('#prova_disponivel_data_fim').datepicker({
		language: 'pt-BR'
	})