class ProfessorsController < ApplicationController
  def index
  	filtro = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina])

    if params[:antigas]
    		filtro = filtro.excluir_antigas
  	end

  	if params[:resolvidas]
  		filtro = filtro.excluir_resolvidas
  	end

  	@provas_grid = initialize_grid(filtro)

    client = client(params[:disciplina])
    client.get_user_role()
  end
end
