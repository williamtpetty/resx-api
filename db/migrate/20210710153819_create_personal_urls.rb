class CreatePersonalUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_urls do |t|
      t.integer :user_id
      t.string :personal_url

      t.timestamps
    end
  end
end
