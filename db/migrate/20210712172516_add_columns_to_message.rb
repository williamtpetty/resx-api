class AddColumnsToMessage < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :body, :text
  end
end
