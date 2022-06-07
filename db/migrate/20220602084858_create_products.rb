class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :quantity, null: false
      t.string :size, null: false
      t.timestamps
    end
  end
end
