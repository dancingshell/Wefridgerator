class RedoRoutesContainerItem < ActiveRecord::Migration
  def change
    remove_reference :items, :container, index: true
    add_reference :categories, :container, index: true
  end
end
