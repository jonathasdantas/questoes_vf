class CreateAlunosProvasTable < ActiveRecord::Migration
  def self.up
	create_table :alunos_provas, :id => false do |t|
		t.references :aluno
		t.references :prova
		t.datetime :data_inicio
	end
	
	add_index :alunos_provas, [:aluno_id, :prova_id]
    add_index :alunos_provas, [:prova_id, :aluno_id]
  end

  def self.down
	drop_table :alunos_provas
  end
end
