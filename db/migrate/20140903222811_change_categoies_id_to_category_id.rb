class ChangeCategoiesIdToCategoryId < ActiveRecord::Migration
  def change
  	remove_reference :items, :categories, index: true
  	add_reference :items, :category, index: true
  end
end
