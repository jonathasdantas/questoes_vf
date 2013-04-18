class CreateAlunosProvas < ActiveRecord::Migration
  def change
    create_table :alunos_provas do |t|
      t.datetime :data_inicio
      t.references :alunos
      t.references :provas

      t.timestamps
    end
    add_index :alunos_provas, :alunos_id
    add_index :alunos_provas, :provas_id
  end
end
