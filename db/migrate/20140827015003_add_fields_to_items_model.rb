class AddFieldsToItemsModel < ActiveRecord::Migration
  def change
    add_reference :items, :user, index: true
    add_reference :items, :container, index: true
    add_column :items, :in_container, :boolean
    add_column :items, :in_list, :boolean
    add_column :items, :is_public, :boolean
  end
end
