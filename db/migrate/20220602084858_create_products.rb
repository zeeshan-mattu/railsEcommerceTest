class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :user
      t.string :name
      t.string :quantity
      t.string :size
      t.timestamps
    end
  end
end
