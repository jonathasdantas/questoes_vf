class Questao < ActiveRecord::Base

  has_many :proposicaos
  belongs_to :prova
end
