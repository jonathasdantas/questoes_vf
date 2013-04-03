class Aluno < ActiveRecord::Base
    validates :redu_id,	:presence => true
    
    has_many :respostas
    has_and_belongs_to_many :provas
end
