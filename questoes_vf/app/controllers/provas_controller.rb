# encoding: utf-8
class ProvasController < ApplicationController
	def index
		@prova = Prova.find(params[:id])

		# Checa se a prova já foi feita
		if @prova.get_data_inicio(params[:estudante_id]) != nil	
			redirect_to prova_path(@prova, :disciplina => params[:disciplina])
		else
			aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', @prova.id, params[:estudante_id]).first

			if aluno_prova != nil
				aluno_prova.data_inicio = DateTime.now
			else
				aluno_prova = AlunosProvas.new(:alunos_id => params[:estudante_id], :provas_id => @prova.id, :data_inicio => DateTime.now)	
			end
		
			if !aluno_prova.save
				redirect_to pre_do_test_path(@prova, :disciplina => params[:disciplina])
			end
		end
	end

	# Verifica se a prova já foi feita se foi redireciona para tela show
	def pre_do
		@prova = Prova.find(params[:id])

		if @prova.get_data_inicio(params[:estudante_id]) != nil
			redirect_to prova_path(@prova, :disciplina => params[:disciplina], :estudante_id => params[:estudante_id])
		end
	end

	def do
		ok = true

		Resposta.transaction do
			params[:respostas].each { |resposta| 
				resposta_obj = Resposta.new(resposta)

				if !resposta_obj.save
					ok = false
				end
			}
		end

		if ok
			redirect_to '/estudantes/1'
		else
			render :do
		end
	end

	def new # GET
		@prova = Prova.new
	end

	def create
		@prova = Prova.new(params[:prova])

		if @prova.save
			redirect_to '/professors/' + 1 + '/?disciplina=' + params[:disciplina]
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
			redirect_to '/professors/' + params[:id] + '/?disciplina=' + params[:disciplina]
		end
	end

	def update
		@prova = Prova.find(params[:id])
	    if @prova.is_editable() && @prova.update_attributes(params[:prova])
	      redirect_to '/professors/' + params[:id] + '/?disciplina=' + params[:disciplina]
	    else
	      render :edit
    	end
	end

	def destroy
	end
end
