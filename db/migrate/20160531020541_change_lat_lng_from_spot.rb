class ChangeLatLngFromSpot < ActiveRecord::Migration
  def change
    change_column :spots, :latitude, :float
    change_column :spots, :longitude, :float
  end
end
