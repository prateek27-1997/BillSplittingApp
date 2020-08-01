class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :user
      t.references :item
      t.integer :item_price
      t.timestamps
    end
  end
end
