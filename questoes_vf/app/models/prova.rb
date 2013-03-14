class Prova < ActiveRecord::Base

    has_many :questaos
    has_and_belongs_to_many :alunos
end
