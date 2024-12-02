class CreateNinjas < ActiveRecord::Migration[7.1]
  def change
    create_table :ninjas do |t|
      t.string :name
      t.integer :num_tel
      t.string :photo
      t.string :specialty
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
