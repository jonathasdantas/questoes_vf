class Prova < ActiveRecord::Base
    validates :titulo, :presence => true
    validates :disponivel_data_inicio, :presence => true
    validates :disponivel_data_fim, :presence => true
    validates :duracao, :presence => true

    has_many :questaos
    has_and_belongs_to_many :alunos

    accepts_nested_attributes_for :questaos, allow_destroy: true

    scope :da_disciplina, lambda { |disciplina| where("provas.disciplina_id = ?", disciplina) }
    scope :do_aluno_disciplina, lambda { |id, disciplina| where("alunos_provas.aluno_id = ? and provas.disciplina_id = ?", id, disciplina).joins(:alunos) }
    scope :do_professor_disciplina, lambda { |id, disciplina| where("professor_id = ? and disciplina_id = ?", id, disciplina) }
    scope :disponiveis, lambda { where("disponivel_data_inicio < ? and disponivel_data_fim > ?", DateTime.now, DateTime.now) }

    # Filtros Grid
    scope :excluir_antigas, lambda { where("disponivel_data_inicio > ?",  180.days.ago) }
    scope :excluir_resolvidas, lambda { where("data_inicio is null") }

    def get_nota(aluno_id, disciplina)
        nota = nil
        nota_valor = 0
        valor_prova = 0

    	prova = Prova.do_aluno_disciplina(aluno_id, disciplina).where("provas.id = ?", self.id)
        if prova.count == 1
            questoes = Questao.where("prova_id = ?", self.id)

            questoes.each { |questao|
                valor_prova = valor_prova + questao.valor

                proposicoes = Proposicao.where("questao_id = ?", questao.id)

                valor_prop = questao.valor / proposicoes.count

                proposicoes.each { |proposicao|
                    resposta = Resposta.where("proposicao_id = ? and aluno_id = ?", proposicao.id, aluno_id).first

                    if resposta != nil && resposta.resposta == proposicao.resposta
                        nota_valor = nota_valor + valor_prop
                        nota = nota_valor
                    end
                }
            }
        end

        # Normaliza a nota do estudante para ficar entre 0 e 10
        if nota != nil
            nota = (nota / valor_prova) * 10.0
        end

        return nota
	end

	def get_media
    	nota = Prova.joins(:questaos).sum("valor")
    	return nota
	end

    def is_editable
        return self.disponivel_data_inicio > DateTime.now
    end
end
