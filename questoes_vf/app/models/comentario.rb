class Comentario < ActiveRecord::Base
  belongs_to :questao
  belongs_to :aluno
end

