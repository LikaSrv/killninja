class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :score
      t.references :ninja, null: false, foreign_key: true

      t.timestamps
    end
  end
end
