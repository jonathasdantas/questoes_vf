class CreateProvas < ActiveRecord::Migration
  def change
    create_table :provas do |t|
      t.integer :professor_id
      t.integer :disciplina_id
      t.integer :aula_id
      t.string :titulo
      t.text :cabecalho
      t.text :rodape
      t.boolean :justificar_falsa
      t.boolean :justificar_verdadeira
      t.integer :qtd_verdadeira_anula
      t.integer :qtd_falsa_para_anular
      t.datetime :data_inicio
      t.datetime :disponivel_data_inicio
      t.datetime :disponivel_data_fim
      t.integer :duracao

      t.timestamps
    end
  end
end
