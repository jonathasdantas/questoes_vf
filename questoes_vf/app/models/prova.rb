class Prova < ActiveRecord::Base
    validates :titulo, :presence => true
    validates :disponivel_data_inicio, :presence => true
    validates :disponivel_data_fim, :presence => true
    validates :duracao, :presence => true

    has_many :questaos
    has_and_belongs_to_many :alunos

    scope :do_aluno, lambda { |id| where("alunos_provas.aluno_id = ?", id).joins(:alunos) }
    scope :do_professor, lambda { |id| where("professor_id = ?", id) }
    scope :disponiveis, lambda { where("disponivel_data_inicio < ? and disponivel_data_fim > ?", DateTime.now, DateTime.now) }

    # Filtros Grid
    scope :excluir_antigas, lambda { where("disponivel_data_inicio > ?",  180.days.ago) }
    scope :excluir_resolvidas, lambda { where("data_inicio is null") }

    def get_nota
    	nota = Prova.joins(:questaos).sum("valor")
    	return nota
	end

	def get_media
    	nota = Prova.joins(:questaos).sum("valor")
    	return nota
	end
end
