class UpdateFieldsForItemModel < ActiveRecord::Migration
  def change
  	remove_column :items, :in_container, :boolean
    remove_column :items, :in_list, :boolean
    add_column :items, :container_type, :string
    remove_column :containers, :container_type, :string
  end
end
