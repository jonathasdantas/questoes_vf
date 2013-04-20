class HomeController < ApplicationController
  def index
  	redirect_to index_estudantes_path(1, :disciplina => 1)

	if params[:contexto] == 'estudante'
		redirect_to '/estudante'
	elsif params[:contexto] == 'professor'
		redirect_to '/professor'
	end
  end
end
