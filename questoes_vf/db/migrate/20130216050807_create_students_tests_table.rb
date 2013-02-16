class CreateStudentsTestsTable < ActiveRecord::Migration
  def self.up
	create_table :students_tests, :id => false do |t|
		t.references :student
		t.references :test
	end
	
	add_index :students_tests, [:student_id, :test_id]
    add_index :students_tests, [:test_id, :student_id]
  end

  def self.down
	drop_table :students_tests
  end
end
