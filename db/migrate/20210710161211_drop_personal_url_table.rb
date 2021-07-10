class DropPersonalUrlTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :personal_urls
  end
end
