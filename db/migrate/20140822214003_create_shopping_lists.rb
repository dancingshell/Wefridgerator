class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
  		
      t.references :group, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
