class ShoppingList < ActiveRecord::Base
	has_many :items
  belongs_to :group
end
