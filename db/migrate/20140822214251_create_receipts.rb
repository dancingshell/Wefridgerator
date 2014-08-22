class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :location
      t.integer :amount
      t.datetime :purchase_date
      t.references :group, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
