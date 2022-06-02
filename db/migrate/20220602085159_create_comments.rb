class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.belongs_to :product
      t.belongs_to :user
      t.text :comment
      t.timestamps

    end
  end
end
