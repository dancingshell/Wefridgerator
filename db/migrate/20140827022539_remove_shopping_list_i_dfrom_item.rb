class RemoveShoppingListIDfromItem < ActiveRecord::Migration
  def change
    remove_reference :items, :shopping_list, index: true 
  end
end
