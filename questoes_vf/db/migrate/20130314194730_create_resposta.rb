lass CreateResposta < ActiveRecord::Migration
  def change
    create_table :resposta do |t|
      t.references :proposicao
      t.references :aluno
      t.boolean :resposta
      t.text :comentario
      t.text :explicacao
      t.timestamp :data
      t.timestamps
    end
    add_index :resposta, :proposicao_id
    add_index :resposta, :aluno_id
  end
end
