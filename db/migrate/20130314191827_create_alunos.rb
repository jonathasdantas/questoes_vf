class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.integer :redu_id

      t.timestamps
    end
  end
end
