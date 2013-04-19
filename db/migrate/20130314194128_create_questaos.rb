class CreateQuestaos < ActiveRecord::Migration
  def change
    create_table :questaos do |t|
      t.references :prova
      t.text :enunciado
      t.text :explicacao
      t.boolean :visibilidade
      t.decimal :valor
      t.timestamps
    end
    add_index :questaos, :prova_id
  end
end
