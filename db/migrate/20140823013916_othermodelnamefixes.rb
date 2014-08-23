class Othermodelnamefixes < ActiveRecord::Migration
  def change
    remove_reference :items, :categories_id, index: true
    add_reference :items, :category_id, :references, index: true
    remove_reference :items, :shopping_lists_id, index: true
    add_reference :items, :shopping_list_id, :references, index: true
  end
end
