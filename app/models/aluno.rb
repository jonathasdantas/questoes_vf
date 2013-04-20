class Aluno < ActiveRecord::Base
    validates :redu_id,	:presence => true
    
    has_one :user
    has_many :respostas
    has_many :comentarios
    has_many :alunos_provas

    def get_nome
    	return self.user.name
    end

    def get_nome_by_redu_id(redu_id)
    	nome = nil

    	user = User.find_by_uid(redu_id)
    	if user != null
    		nome = user.name
    	end

		return nome
    end
end
