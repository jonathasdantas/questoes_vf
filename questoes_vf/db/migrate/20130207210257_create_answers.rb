class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :answer
      t.text :comment
      t.double :ranking
      t.timestamp :answer_date

      t.timestamps
    end
  end
end
