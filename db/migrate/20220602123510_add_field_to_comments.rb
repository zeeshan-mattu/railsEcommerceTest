class AddFieldToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :title, :string, null: false, default: ""
  end
end
