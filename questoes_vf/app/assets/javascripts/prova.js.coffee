# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

organizar_nomes = ->
	$('.titulo_questao').each (i, elem) ->
		$(elem).text("Questão " + (i + 1))

check_required = (components) ->
	ok = true

	for elem in components
		for _elem in elem
			if elem.val() == ""
				elem.parent().parent().addClass('control-error')
				ok = false
			else
				elem.parent().parent().removeClass('control-error')
	ok



$(document).ready ->
	$('#prova_disponivel_data_inicio').datepicker({
		language: 'pt-BR',
		format: 'dd/mm/yyyy'
	})
	
	$('#prova_disponivel_data_fim').datepicker({
		language: 'pt-BR',
		format: 'dd/mm/yyyy'
	})

	# Questões
	$('.questoes').treeview({
		animated: "fast",
		collapsed: true,
		unique: true
	})
	organizar_nomes();

	$('form').on 'click', '.remove_icon', (event) ->
		$($(this).parents('li')[0]).remove()
		organizar_nomes();

	$('form').on 'click', '.add_fields', (event) ->
	    time = new Date().getTime()
	    regexp = new RegExp($(this).data('id'), 'g')

	    if $(this).parent().hasClass('add_questao')
	    	$(this).parent().siblings('ul').append($(this).data('fields').replace(regexp, time))

	    	$('.questoes').treeview({ animated: "fast", collapsed: true, unique: true })
	    	organizar_nomes()
	    else if $(this).parent().hasClass('controls')
	    	element = $(this).parents('ul')[0]
	    	$(element).append($(this).data('fields').replace(regexp, time))

	    event.preventDefault()

	# Logica do botao avancar
	$('.next-button').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(6)) + 1

		if next == 3 && check_required([
				$('#prova_disponivel_data_inicio'),
				$('#prova_disponivel_data_fim'),
				$('#prova_titulo'),
				$('#prova_duracao')
			]) || next == 4 && check_required([
				$(":regex(id, #*_valor)"),
				$(":regex(id, #*_enunciado)"),
				$(":regex(id, #*_texto)")
			])
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
		$('#form_container').children('form').submit()