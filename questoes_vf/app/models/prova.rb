class Prova < ActiveRecord::Base
    validates :titulo, :presence => true
    validates :disponivel_data_inicio, :presence => true
    validates :disponivel_data_fim, :presence => true
    validates :duracao, :presence => true

    has_many :questaos
    has_and_belongs_to_many :alunos

    def get_nota
    	return 8.5
	end
end
