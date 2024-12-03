class AddUserIdToNinjas < ActiveRecord::Migration[7.1]
  def change
    add_reference :ninjas, :user, null: false, foreign_key: true
  end
end
