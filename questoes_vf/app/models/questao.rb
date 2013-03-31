class Questao < ActiveRecord::Base
  validates :enunciado,	:presence => true
  validates :valor,	:presence => true
  
  has_many :proposicaos
  belongs_to :prova
end
