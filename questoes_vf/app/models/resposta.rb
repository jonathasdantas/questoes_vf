class Resposta < ActiveRecord::Base
  validates :resposta, :presence => true

  belongs_to :proposicao
  belongs_to :aluno
end
