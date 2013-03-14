class Resposta < ActiveRecord::Base
  belongs_to :proposicao
  belongs_to :aluno
end
