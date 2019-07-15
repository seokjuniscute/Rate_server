class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :content,null: false, default: ""
      t.float :importance,null: false, default: ""
      t.integer :year,null: false, default: ""
      t.integer :month,null: false, default: ""
      t.integer :day,null: false, default: ""
      t.integer :hour,null: false, default: ""
      t.integer :min,null: false, default: ""
      t.string :ide,null: false, default: ""
      
      
      t.timestamps
    end
  end
end
