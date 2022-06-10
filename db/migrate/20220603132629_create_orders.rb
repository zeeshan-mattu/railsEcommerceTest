class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end
