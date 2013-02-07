class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :redu_id

      t.timestamps
    end
  end
end
