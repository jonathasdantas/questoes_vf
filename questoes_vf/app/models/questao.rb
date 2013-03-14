class Questao < ActiveRecord::Base
  validates :enunciado,	:presence => true
                        :length => { :minimum => 10 }

  has_many :proposicaos
  belongs_to :prova
end
