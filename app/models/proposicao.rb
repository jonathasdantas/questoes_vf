class Proposicao < ActiveRecord::Base
  validates_inclusion_of :resposta, :in => [true, false]
  validates :texto, :presence => true
  
  has_many :respostas
  belongs_to :questao

  def get_resposta(estudante_id)
  	return Resposta.where('proposicao_id = ?', self.id).first
  end
end
