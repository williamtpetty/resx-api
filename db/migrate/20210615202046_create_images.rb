class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :listing_id
      t.string :url

      t.timestamps
    end
  end
end
