class ComentariosController < ApplicationController
  def new
  	@comentario =  Comentario.new
  end

  def create
   	@comentario = Comentario.new(params[:comentario])
  	@comentario.save

  	redirect_to prova_path(params[:prova_id], {:disciplina => params[:disciplina], :estudante_id => params[:estudante_id], :professor_id => params[:professor_id]})
  end

  def destroy
  	@comentario = Comentario.find(params[:id])

  	if @comentario.aluno_id.to_s() == params[:estudante_id]
  		@comentario.destroy
	end

  	redirect_to prova_path(params[:prova_id], {:disciplina => params[:disciplina], :estudante_id => params[:estudante_id], :professor_id => params[:professor_id]})
  end
end
