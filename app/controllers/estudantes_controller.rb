class EstudantesController < ApplicationController
  def index
  	filtro = Prova.da_disciplina(params[:disciplina])

    if params[:antigas]
    		filtro = filtro.excluir_antigas
  	end

  	if params[:resolvidas]
  		filtro = filtro.excluir_resolvidas
  	end

  	@provas_grid = initialize_grid(filtro)

    client = ReduClient.new(User.first.access_token, 2957)
    client.create_canvas(2957, "http://www.redu.com.br", "Meu Vanas")
  end
end
