class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :redu_id

      t.timestamps
    end
  end
end
