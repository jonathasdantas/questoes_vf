class RelatoriosController < ApplicationController
  def index
  	@provas = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina])
  end

  def report
    client = client(params[:disciplina])

    @prova = Prova.find(params[:prova][:id])
    @num_matriculados = client.members_count
    @num_fizeram_prova = 4
    @media = @prova.get_media(@prova.disciplina_id)
    @tempo_medio = 30

    if params[:report] == 'Textual'
      render "texto", :layout => "report"
  	elsif params[:report] == 'Excel'
  			
  	end
  end

  def texto
    render :layout => "report"
  end

  def excel
  end
end
