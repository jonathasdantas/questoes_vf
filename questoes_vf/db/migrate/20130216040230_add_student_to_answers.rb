class AddStudentToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :student_id, :integer

  end
end
