class Questao < ActiveRecord::Base
  validates :enunciado,	:presence => true
  validates :valor,	:presence => true
  
  has_many :comentarios
  has_many :proposicaos
  belongs_to :prova

  accepts_nested_attributes_for :proposicaos, allow_destroy: true
end
