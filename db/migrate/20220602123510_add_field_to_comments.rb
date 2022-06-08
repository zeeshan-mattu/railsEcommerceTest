class AddFieldToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :name, :string, null: false, default: ""
  end
end
