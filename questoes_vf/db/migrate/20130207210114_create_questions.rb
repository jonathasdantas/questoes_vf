class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :statement
      t.boolean :answer
      t.boolean :justify_false
      t.boolean :justify_true
      t.int :amount_to_cancel
      t.text :explanation
      t.boolean :visibility

      t.timestamps
    end
  end
end
