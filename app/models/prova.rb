class Prova < ActiveRecord::Base
    validates :titulo, :presence => true
    validates :disponivel_data_inicio, :presence => true
    validates :disponivel_data_fim, :presence => true
    validates :duracao, :presence => true

    has_many :questaos
    has_many :alunos_provas

    accepts_nested_attributes_for :questaos, allow_destroy: true

    scope :da_disciplina, lambda { |disciplina| where("provas.disciplina_id = ?", disciplina) }
    scope :do_professor_disciplina, lambda { |id, disciplina| where("professor_id = ? and disciplina_id = ?", id, disciplina) }
    scope :disponiveis, lambda { where("disponivel_data_inicio <= ? and disponivel_data_fim > ?", DateTime.now, DateTime.now) }

    # Filtros Grid
    scope :excluir_antigas, lambda { where("disponivel_data_inicio > ?",  180.days.ago) }
    scope :excluir_resolvidas, lambda { where('alunos_provas.data_inicio is null').joins("LEFT OUTER JOIN alunos_provas ON provas.id = alunos_provas.provas_id") }

    def get_nota(aluno_id, disciplina)
        nota = nil
        nota_valor = 0
        valor_prova = 0

        aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', self.id, aluno_id).first

        if aluno_prova != nil && aluno_prova.data_inicio != nil && self.disciplina_id.to_s() == disciplina.to_s()
            questoes = Questao.where("prova_id = ?", self.id)

            questoes.each { |questao|
                erradas = 0

                valor_prova = valor_prova + questao.valor

                proposicoes = Proposicao.where("questao_id = ?", questao.id)

                valor_prop = questao.valor / proposicoes.count

                proposicoes.each { |proposicao|
                    resposta = Resposta.where("proposicao_id = ? and aluno_id = ?", proposicao.id, aluno_id).first

                    if resposta != nil && resposta.resposta != proposicao.resposta
                        erradas += 1
                        nota = nota_valor;
                    end

                    if resposta != nil && resposta.resposta == proposicao.resposta
                        nota_valor = nota_valor + valor_prop
                        nota = nota_valor
                    end
                    
                    if erradas == self.qtd_falsa_para_anular && self.qtd_falsa_para_anular > 0
                        nota_valor = nota_valor - (valor_prop * self.qtd_verdadeira_anula)
                        nota = nota_valor
                        erradas = 0
                    end
                }

                if nota && nota < 0
                    nota = 0
                    nota_valor = 0
                end
            }
        end

        # Normaliza a nota do estudante para ficar entre 0 e 10
        if nota != nil
            nota = (nota / valor_prova) * 10.0
        end

        return nota
	end

    def get_data_inicio(aluno_id)
        aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', self.id, aluno_id).first

        return aluno_prova != nil ? aluno_prova.data_inicio : nil
    end

    def get_data_fim(aluno_id)
        aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', self.id, aluno_id).first

        return aluno_prova != nil ? aluno_prova.data_fim : nil
    end

	def get_media(disciplina_id)
        media = nil
        valor_media = 0.0

        num = 1;

        if !is_avaliable && !is_editable
    	   alunos_provas = AlunosProvas.where('provas_id = ? and data_inicio is not null', self.id)

           num = alunos_provas.count

           alunos_provas.each { |aluno_prova|
                nota = get_nota(aluno_prova.alunos_id, disciplina_id)
                valor_media = valor_media + nota ||= 0.0
                media = valor_media
           }
        end

        if media != nil
            media = media / num
        end

        return media
	end

    # Segundos para fim da prova
    def get_end_time(aluno_id)
        tempo = DateTime.now.to_i()

        data_inicio = self.get_data_inicio(aluno_id)

        if data_inicio != nil
            tempo = data_inicio.to_i() + self.duracao * 60
        end

        return tempo
    end

    def is_editable
        return self.disponivel_data_inicio > DateTime.now
    end

    def is_avaliable
        return self.disponivel_data_inicio <= DateTime.now && self.disponivel_data_fim > DateTime.now 
    end

    def times_over(aluno_id)
        return self.get_end_time(aluno_id) <= DateTime.now.to_i() || self.get_data_fim(aluno_id) != nil
    end

    def end_time(aluno_id)
        retorno = false

        aluno_prova = AlunosProvas.where('provas_id = ? and alunos_id = ?', self.id, aluno_id).first

        if aluno_id != nil
            aluno_prova.data_fim = DateTime.now
            retorno = aluno_prova.save
        end

        return retorno
    end
end
