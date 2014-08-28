class Item < ActiveRecord::Base
  
  belongs_to :categories
  belongs_to :user
end
