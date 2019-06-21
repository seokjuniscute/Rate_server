class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :ide,null: false, default: ""
      t.string :password,null: false, default: ""
      t.integer :hour,null: false, default: ""
      t.integer :min,null: false, default: ""
      t.datetime :created_at

      
      t.timestamps
    end
  end
end
