class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.belongs_to :item
      t.belongs_to :user

      t.text :description, null: false
      t.timestamps

    end
  end
end
