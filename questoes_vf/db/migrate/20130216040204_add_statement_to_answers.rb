class AddStatementToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :statement_id, :integer

  end
end
