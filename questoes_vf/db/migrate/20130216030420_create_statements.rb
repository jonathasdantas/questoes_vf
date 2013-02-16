class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.boolean :answer

      t.timestamps
    end
  end
end
