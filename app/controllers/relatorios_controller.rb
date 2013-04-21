class RelatoriosController < ApplicationController
  def index
  	@provas = Prova.do_professor_disciplina(params[:professor_id], params[:disciplina])
  end

  def report
    client = client(params[:disciplina])

    @prova = Prova.find(params[:prova][:id])

    tempos = tempos(@prova.id)

    @num_matriculados = client.members_count
    @num_fizeram_prova = num_fizeram_prova(@prova.id, params[:disciplina])
    @media = @prova.get_media(@prova.disciplina_id)
    @tempo_medio = tempos[0]
    @tempo_max = tempos[1]
    @tempo_min = tempos[2]

    if params[:report] == 'Textual'
      render "texto", :layout => "report"
  	elsif params[:report] == 'Excel'
  			
  	end
  end

  def excel
  end

  private

  def num_fizeram_prova(prova_id, disciplina_id)
    return AlunosProvas.where('provas_id = ? and data_fim is not null', prova_id).count
  end

  def tempos(prova_id)
    media = nil
    max = nil
    min = nil

    total = 0

    alunos_provas = AlunosProvas.where('provas_id = ? and data_fim is not null', prova_id)

    alunos_provas.each { |alunos_prova|
      valor = ((alunos_prova.data_fim - alunos_prova.data_inicio).to_i() / 60)
      total = total + valor

      media = total

      if max == nil
        max = valor
      else
        max = valor > max ? valor : max
      end

      if min == nil
        min = valor
      else
        min = valor < min ? valor : min
      end
    }

    if media != nil
      media = media / alunos_provas.count
    end

    return [media, max, min]
  end

end
