class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.references :user
      t.integer :redu_id

      t.timestamps
    end
  end
end
