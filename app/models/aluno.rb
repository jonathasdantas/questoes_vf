class Aluno < ActiveRecord::Base
    validates :redu_id,	:presence => true
    
    has_one :user
    has_many :respostas
    has_many :comentarios
    has_many :alunos_provas

    def get_nome
    	return self.user.name
    end
end
