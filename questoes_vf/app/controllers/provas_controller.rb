class ProvasController < ApplicationController
	def index # APENAS ESTUDANTE (FAZER A PROVA)
		@prova = Prova.find(params[:id])
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
			redirect_to '/professors/1'
		else
			render :new
		end
	end

	def show # ver resultado da prova
	end

	def edit
		@prova = Prova.find(params[:id])

		if !@prova.is_editable()
			redirect_to '/professors/1'
		end
	end

	def update
		@prova = Prova.find(params[:id])
	    if @prova.is_editable() && @prova.update_attributes(params[:prova])
	      redirect_to '/professors/1'
	    else
	      render :edit
    end
	end

	def destroy
	end
end
