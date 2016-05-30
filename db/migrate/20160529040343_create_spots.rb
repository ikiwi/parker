class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.integer :latitude
      t.integer :longitude
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
