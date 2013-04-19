class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.references :questao
      t.references :aluno
      t.text :texto
      t.decimal :ranking

      t.timestamps
    end
    add_index :comentarios, :questao_id
    add_index :comentarios, :aluno_id
  end
end
