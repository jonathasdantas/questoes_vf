class EstudantesController < ApplicationController
  def index
  	filtro = Prova.do_aluno(params[:id])

  	if params[:antigas]
  		filtro = filtro.excluir_antigas
	end

	if params[:resolvidas]
		filtro = filtro.excluir_resolvidas
	end

  	@provas_grid = initialize_grid(filtro)
  end
end