class ComentarioController < ApplicationController
  def new
  	@comentario =  Comentario.new
  end

  def create
   	@comentario = Comentario.new(params[:comentario])
 
  	@comentario.save
  end

  def destroy

  end
end
