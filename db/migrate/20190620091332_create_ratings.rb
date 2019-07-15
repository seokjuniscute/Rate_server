class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :what_you_do, null: false, default: ""
      t.string :what_you_good, null: false, default: ""
      t.string :what_you_bad, null: false, default: ""
      t.integer :importance
      t.string :ide,null: false, default: ""
      t.integer :year,null: false, default: 0
      t.integer :month,null: false, default: 0
      t.integer :day,null: false, default: 0
      t.timestamps
    end
  end
end
