class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :exp_date
      t.integer :quantity
      t.references :categories, index: true
      t.references :shopping_lists, index: true

      t.timestamps
    end
  end
end
