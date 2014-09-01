class Item < ActiveRecord::Base
  
  belongs_to :categories
  belongs_to :user

  
  validates :name, presence: true
  validates :quantity, {presence: true, numericality: true}
end
