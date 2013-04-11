class ProvasController < ApplicationController
	def index # APENAS ESTUDANTE (FAZER A PROVA)
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

	def show
	end

	def edit
		@prova = Prova.find(params[:id])
	end

	def update
		@prova = Prova.find(params[:id])
	    if @prova.update_attributes(params[:prova])
	      redirect_to '/professors/1'
	    else
	      render :edit
    end
	end

	def destroy
	end
end
