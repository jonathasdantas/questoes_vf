# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

organizar_nomes = (classe) ->
	$(classe).each (i, elem) ->
		$(elem).text("Questão " + (i + 1))

check_required = (components) ->
	ok = true

	for elem in components
		for _elem in elem
			if $(_elem).val() == ""
				$(_elem).parent().parent().addClass('control-error')
				ok = false
			else
				$(_elem).parent().parent().removeClass('control-error')
	ok

# Preenche campos do resumo
fill_passo3 = ->
	$('.titulo_res').html($('#prova_titulo').val())
	$('.cabecalho_res').html($('#prova_cabecalho').val())
	$('.rodape_res').html($('#prova_rodape').val())

	verdadeira_anula = '0'
	falsa_anula = '0'

	if $('#prova_qtd_verdadeira_anula').val() != ""
		verdadeira_anula = $('#prova_qtd_verdadeira_anula').val()
	if $('#prova_qtd_falsa_para_anular').val() != ""
		falsa_anula = $('#prova_qtd_falsa_para_anular').val()

	$('.anula_errada_res').html(verdadeira_anula)
	$('.anula_correta_res').html(falsa_anula)

	$('.disponivel_inicio_res').html($('#prova_disponivel_data_inicio').val())
	$('.disponivel_fim_res').html($('#prova_disponivel_data_fim').val())
	$('.duracao_res').html($('#prova_duracao').val())

	justificar_errada = "Não"
	justificar_correta = "Não"

	if $('#prova_justificar_falsa').is(':checked')
		justificar_errada = "Sim"

	if $('#prova_justificar_verdadeira').is(':checked')
		justificar_correta = "Sim"

	$('.justificar_errada_res').html(justificar_errada)
	$('.justificar_correta_res').html(justificar_correta)

	generate_questoes_res()
	organizar_nomes('.questoes_res .titulo_questao')

generate_questoes_res = ->
	$('.questoes_res').html("")

	valores = $(":regex(id, #*_valor)")
	enunciados = $(":regex(id, #*_enunciado)")

	questoes = $('.questoes').find('ul')

	$(questoes).each (i, elem) ->
		reg_valor = new RegExp('#VALOR#', 'g')
		reg_enum = new RegExp('#ENUNCIADO_QUESTAO#', 'g')
		reg_props = new RegExp('#PROPOSICAO#', 'g')

		textos = $(elem).find(":regex(id, #*_texto)")
		falses = $(elem).find(":regex(id, #*_resposta_false)")
		trues = $(elem).find(":regex(id, #*_resposta_true)")

		proposicoes = ""

		$(textos).each (j, eleme) ->
			reg_texto = new RegExp('#ENUNCIADO_PROPOSICAO#', 'g')
			reg_radio = new RegExp('#CHECK#', 'g')

			text_check = 'Falso'

			if ($(trues[i]).is(':checked'))
				text_check = 'Verdadeiro'

			proposicoes = proposicoes + $('.proposicao_res').val()
			.replace(reg_texto, $(eleme).val())
			.replace(reg_radio, text_check)

		$('.questoes_res').append($('.questao_res').val()
			.replace(reg_valor, $(valores[i]).val())
			.replace(reg_enum, $(enunciados[i]).val())
			.replace(reg_props, proposicoes)
		)

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
	organizar_nomes('.titulo_questao');

	# Remover questão ou proposição
	$('form').on 'click', '.remove_icon', (event) ->
		$($(this).parents('li')[0]).remove()
		organizar_nomes('.titulo_questao');

	# Adicionar campos
	$('form').on 'click', '.add_fields', (event) ->
	    time = new Date().getTime()
	    regexp = new RegExp($(this).data('id'), 'g')

	    if $(this).parent().hasClass('add_questao')
	    	$(this).parent().siblings('ul').append($(this).data('fields').replace(regexp, time))

	    	$('.questoes').treeview({ animated: "fast", collapsed: true, unique: true })
	    	organizar_nomes('.titulo_questao')
	    else if $(this).parent().hasClass('controls')
	    	element = $(this).parents('ul')[0]
	    	$(element).append($(this).data('fields').replace(regexp, time))

	    event.preventDefault()

	# Logica do botao avancar
	$('.next-button').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(6)) + 1

		if (next == 3 && check_required([
				$('#prova_disponivel_data_inicio'),
				$('#prova_disponivel_data_fim'),
				$('#prova_titulo'),
				$('#prova_duracao')
			])) || (next == 4 && check_required([
				$(":regex(id, #*_valor)"),
				$(":regex(id, #*_enunciado)"),
				$(":regex(id, #*_texto)")
			]))

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
					fill_passo3()
					$('.questoes_res').treeview({ animated: "fast", collapsed: true, unique: true })
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

	# FAZER PROVA
	# Botões para fazer a prova
	if parseInt($('#questoes_num').val()) == 1
		$('.next-button-prova').hide()

	$('.next-button-prova').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(8)) + 1

		$(this).data('next-step', '#questao' + next)
		$('.prev-button-prova').data('next-step', '#questao' + (next - 2))
		$('.prev-button-prova').show()

		# Mostra o passo correto
		$('#questao' + (next - 2)).hide()
		$(step).show()

		# Ultimo passo
		if next == (parseInt($('#questoes_num').val()) + 1)
			$(this).hide()

	$('.prev-button-prova').click ->
		step = $(this).data('next-step')
		next = parseInt(step.substr(8)) - 1

		$(this).data('next-step', '#questao' + next)
		$('.next-button-prova').data('next-step', '#questao' + (next + 2))

		# Mostra o passo correto
		$('#questao' + (next + 2)).hide()
		$(step).show()

		if next == 0
			$(this).hide()
		else if next >= 0
			$('.next-button-prova').show()

	$('.submit-button-prova').click ->
		nao_respondido = false
		proposicoes_count = $('input[type=radio]').length / 2
		inputs = ""

		for x in [1..parseInt($('#questoes_num').val())]
			radios = $('#questao' + x + ' input[type=radio]')
			
			for y in [1..(radios.length / 2)]
				resposta = $(radios.filter('.resposta_' + y + ':checked')).val()

				if (resposta == undefined)
					resposta = false
					nao_respondido = true

				inputs = inputs + '<input type="hidden" name="respostas[]resposta" value="' + resposta + '" />'

				prop_id = $('#questao' + x + ' input[type=hidden]:regex(name, proposicao_id)')[y - 1]	
				inputs = inputs + '<input type="hidden" name="respostas[]proposicao_id" value="' + $(prop_id).val() + '" />'
				inputs = inputs + '<input type="hidden" name="respostas[]aluno_id" value="' + $('#aluno_id').val() + '" />'

		form = $('.prova_container').children('form')

		if nao_respondido
			if confirm 'Existem proposições não respondidas. Elas serão consideradas falsas. Deseja continuar?'
				form.append(inputs)
				form.submit()
		else
			form.append(inputs)
			form.submit()
