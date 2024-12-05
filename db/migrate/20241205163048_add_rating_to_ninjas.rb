class AddRatingToNinjas < ActiveRecord::Migration[7.1]
  def change
    add_column :ninjas, :rating, :integer
  end
end
