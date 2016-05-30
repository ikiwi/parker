class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.integer :latitude
      t.integer :longitude
      t.integer :eta

      t.timestamps null: false
    end
  end
end
