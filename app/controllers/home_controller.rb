class HomeController < ApplicationController
  def index
	if params[:redu_container] == 'space'
		redirect_to index_professores_path(session[:user_id], :disciplina => params[:redu_space_id])
	end
  end
end
