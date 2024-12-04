class AddCoordinatesToNinjas < ActiveRecord::Migration[7.1]
  def change
    add_column :ninjas, :latitude, :float
    add_column :ninjas, :longitude, :float
  end
end
