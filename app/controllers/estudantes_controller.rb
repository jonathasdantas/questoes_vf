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

    client = ReduClient.new(User.first.token, 2957)
    #client.create_canvas("http://questoes-vf.herokuapp.com/professores/1" + "?disciplina=1", "Questoes V ou F")
    client.create_canvas("http://www.redu.com.br" + "?disciplina=1", "Questoes V ou F")
  end
end
