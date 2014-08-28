class Container < ActiveRecord::Base
  belongs_to :group
 
  has_many :arts
  has_many :receipts
  has_many :categories
  has_many :items, through: :categories
  
  
end
