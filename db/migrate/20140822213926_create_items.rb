class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :exp_date
      t.integer :quantity
      t.references :category, index: true
      t.references :shopping_list, index: true

      t.timestamps
    end
  end
end
