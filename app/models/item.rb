class Item < ActiveRecord::Base
  belongs_to :categories
  belongs_to :shopping_lists
end
