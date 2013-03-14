class CreateProposicaos < ActiveRecord::Migration
  def change
    create_table :proposicaos do |t|
      t.references :questao
      t.boolean :resposta
      t.double :valor

      t.timestamps
    end
    add_index :proposicaos, :questao_id
  end
end
