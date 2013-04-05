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

	def edit # GET
	end

	def update # POST
	end

	def destroy
	end
end
