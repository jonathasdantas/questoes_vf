class Resposta < ActiveRecord::Base
  validates_inclusion_of :resposta, :in => [true, false]

  belongs_to :proposicao
  belongs_to :aluno
end
