class ProfessorsController < ApplicationController
  def index
    client = client(params[:disciplina])

    if !client.is_member(params[:professor_id])

    	filtro = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina]).order("updated_at DESC")

      if params[:antigas]
      		filtro = filtro.excluir_antigas
    	end

    	if params[:resolvidas]
    		filtro = filtro.excluir_resolvidas
    	end

    	@provas_grid = initialize_grid(filtro)

    else
      redirect_to index_estudantes_path(params[:professor_id], :disciplina => params[:disciplina])
    end
  end
end
