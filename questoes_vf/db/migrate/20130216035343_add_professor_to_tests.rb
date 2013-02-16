class AddProfessorToTests < ActiveRecord::Migration
  def change
    add_column :tests, :professor_id, :integer

  end
end
