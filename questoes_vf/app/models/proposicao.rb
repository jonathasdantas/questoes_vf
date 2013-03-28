class Proposicao < ActiveRecord::Base
  validates :resposta, :presence => true
  validates :valor, :presence => true
  validates :texto, :presence => true
  has_many :resposta
  belongs_to :questao
end
