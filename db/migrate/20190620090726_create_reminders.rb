class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.string :content
      t.integer :importance
      t.date :setted_date
      t.time :setted_time
      
      
      t.timestamps
    end
  end
end
