class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :availability
      t.string :price

      t.timestamps
    end
  end
end
