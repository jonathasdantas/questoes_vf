# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	$('#prova_disponivel_data_inicio').datepicker({
		language: 'pt-BR',
		format: 'dd/mm/yyyy'
	})
	
	$('#prova_disponivel_data_fim').datepicker({
		language: 'pt-BR',
		format: 'dd/mm/yyyy'
	})

	$('.questoes').treeview({
		animated: "fast",
		collapsed: true,
		unique: true
	})

	# Logica do botao avancar
	$('.next-button').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(6)) + 1

		$(this).data('next-step', '#passo' + next)
		$('.prev-button').data('next-step', '#passo' + (next - 2))
		$('.prev-button').show()

		# Mostra o passo correto
		$('#passo' + (next - 2)).hide()
		$(step).show()

		# Ajusta BG
		$('#form_steps nav').css('background-position-y', $(step).data('background-position'))

		# Ultimo passo
		if next == 4
			$(this).hide()
			$('.submit-button').show()

	# Logica do botao voltar
	$('.prev-button').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(6)) - 1

		$(this).data('next-step', '#passo' + next)
		$('.next-button').data('next-step', '#passo' + (next + 2))

		# Mostra o passo correto
		$('#passo' + (next + 2)).hide()
		$(step).show()

		# Ajusta BG
		$('#form_steps nav').css('background-position-y', $(step).data('background-position'))

		# Segundo passo ou primeiro
		if next == 1
			$('.next-button').show()
			$('.submit-button').hide()
		else if next == 0
			$(this).hide()

	# Envia o formulario
	$('.submit-button').click ->
		$('#new_prova').submit()