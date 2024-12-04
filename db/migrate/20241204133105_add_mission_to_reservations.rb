class AddMissionToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :mission, :string
  end
end
