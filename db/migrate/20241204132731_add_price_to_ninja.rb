class AddPriceToNinja < ActiveRecord::Migration[7.1]
  def change
    add_column :ninjas, :price, :integer
  end
end
