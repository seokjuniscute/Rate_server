class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ide
      t.string :password
      t.integer :hour
      t.integer :min
      t.datetime :created_at

      
      t.timestamps
    end
  end
end
