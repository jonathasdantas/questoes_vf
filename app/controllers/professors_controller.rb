class ProfessorsController < ApplicationController
  def index
    client = client(params[:disciplina])

    if !client.is_member(params[:professor_id])

    	filtro = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina])

      if params[:antigas]
      		filtro = filtro.excluir_antigas
    	end

    	if params[:resolvidas]
    		filtro = filtro.excluir_resolvidas
    	end

    	@provas_grid = initialize_grid(filtro)

    else
      render "shared/error_permission"
    end
  end
end
