class HomeController < ApplicationController
  def index
	if params[:contexto] == 'estudante'
		redirect_to '/estudante'
	elsif params[:contexto] == 'professor'
		redirect_to '/professor'
	end
  end
end
