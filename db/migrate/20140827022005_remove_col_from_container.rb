class RemoveColFromContainer < ActiveRecord::Migration
  def change
    remove_reference :categories, :container, index: true
  end
end
