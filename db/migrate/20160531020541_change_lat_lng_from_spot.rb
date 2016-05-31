class ChangeLatLngFromSpot < ActiveRecord::Migration
  def change
    change_column :Spots, :latitude, :float
    change_column :Spots, :longitude, :float
  end
end
