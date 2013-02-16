class AddQuestionToStatements < ActiveRecord::Migration
  def change
    add_column :statements, :question_id, :integer

  end
end
