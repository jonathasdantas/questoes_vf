class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :aluno
      t.string :email
      t.string :login
      t.string :name
      t.integer :uid
      t.string :token

      t.timestamps
    end
  end
end
