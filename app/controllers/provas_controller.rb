# encoding: utf-8
class ProvasController < ApplicationController
	def index
		@prova = Prova.find(params[:id])

		# Checa se a prova já foi feita
		if @prova.get_data_inicio(params[:estudante_id]) != nil	&& @prova.times_over(params[:estudante_id])
			redirect_to prova_path(@prova, :disciplina => params[:disciplina])
		else
			aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', @prova.id, params[:estudante_id]).first
			data_inicio = @prova.get_data_inicio(params[:estudante_id])

			change = false

			if aluno_prova != nil && data_inicio == nil
				aluno_prova.data_inicio = DateTime.now
				change = true
			elsif aluno_prova == nil
				aluno_prova = AlunosProvas.new(:alunos_id => params[:estudante_id], :provas_id => @prova.id, :data_inicio => DateTime.now)	
				change = true
			end
		
			if change && !aluno_prova.save
				redirect_to pre_do_test_path(@prova, :disciplina => params[:disciplina])
			end
		end
	end

	# Verifica se a prova já foi feita se foi redireciona para tela show
	def pre_do
		@prova = Prova.find(params[:id])

		if @prova.get_data_inicio(params[:estudante_id]) != nil && @prova.times_over(params[:estudante_id])
			redirect_to prova_path(@prova, :disciplina => params[:disciplina], :estudante_id => params[:estudante_id])
		end

		if !@prova.times_over(params[:estudante_id])
			redirect_to do_test_path(@prova, :disciplina => params[:disciplina], :estudante_id => params[:estudante_id])
		end
	end

	def do
		ok = true

		@prova = Prova.find(params[:prova_id])

		#if !@prova.times_over(params[:estudante_id])
			Resposta.transaction do
				params[:respostas].each { |resposta| 
					resposta_obj = Resposta.new(resposta)

					if resposta_obj.resposta == nil
						resposta_obj.resposta = false
					end

					if !resposta_obj.save
						ok = false
					end
				}
			end
		#end

		if ok
			@prova.end_time(params[:estudante_id])
			redirect_to index_estudantes_path(params[:estudante_id], {:disciplina => params[:disciplina]})
		else
			render :do
		end
	end

	def new # GET
		@prova = Prova.new
	end

	def create
		@prova = Prova.new(params[:prova])
		@prova.disponivel_data_fim = @prova.disponivel_data_fim + 23.hours + 59.minutes

		if @prova.save
			# Cria o canvas da prova
			client = client(params[:prova][:disciplina_id])
			subject = client.create_subject("Prova - " + @prova.titulo)
			client.create_lecture(subject['id'], @prova.titulo, QuestoesVf::Application.config.root_url + pre_do_test_path(@prova.id, @session_user.uid, :disciplina => params[:prova][:disciplina_id]))

			redirect_to index_professores_path(params[:prova][:professor_id], :disciplina => params[:prova][:disciplina_id])
		else
			render :new
		end
	end

	def show # ver resultado da prova
		@prova = Prova.find(params[:id])
	end

	def edit
		@prova = Prova.find(params[:id])

		if !@prova.is_editable()
			redirect_to index_professores_path(params[:professor_id], {:disciplina => params[:disciplina]})
		end
	end

	def update
		@prova = Prova.find(params[:id])
	    if @prova.is_editable() && @prova.update_attributes(params[:prova])
	      redirect_to index_professores_path(params[:prova][:professor_id], :disciplina => params[:prova][:disciplina_id])
	    else
	      render :edit
    	end
	end

	def destroy
	end
end
