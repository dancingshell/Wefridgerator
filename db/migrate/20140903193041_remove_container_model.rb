class RemoveContainerModel < ActiveRecord::Migration
  def change
    drop_table :containers
    remove_reference :categories, :container, index: true
    add_reference :categories, :group, index: true
  end
end
