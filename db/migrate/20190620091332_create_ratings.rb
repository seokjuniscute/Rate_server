class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :what_you_do
      t.string :what_yuo_good
      t.string :what_you_bad
      t.string :ide
      t.datetime :created_at
      t.timestamps
    end
  end
end
