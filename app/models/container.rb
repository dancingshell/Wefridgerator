class Container < ActiveRecord::Base
  belongs_to :group
 
  has_many :arts
  has_many :receipts
  has_many :items
  has_many :categories, through: :items
  
end
