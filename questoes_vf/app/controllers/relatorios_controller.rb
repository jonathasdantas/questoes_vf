class RelatoriosController < ApplicationController
  def index
  	@provas = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina])
  end

  def report
  	if params[:report] == 'Textual'
  		
  	elsif params[:report] == 'Excel'
  			
  	end
  end

  def texto
  end

  def excel
  end
end
