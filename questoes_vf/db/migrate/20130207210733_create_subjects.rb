class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :redu_id

      t.timestamps
    end
  end
end
