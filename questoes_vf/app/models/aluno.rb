class Aluno < ActiveRecord::Base
    validates :redu_id,	:presence => true
    
    has_many :respostas
    has_many :comentarios
    has_many :alunos_provas

    def get_nome
    	return "Jose da Silva"
    end
end
