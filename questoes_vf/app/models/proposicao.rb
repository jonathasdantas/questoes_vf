class Proposicao < ActiveRecord::Base

  has_many :resposta
  belongs_to :questao
end
