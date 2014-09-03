class Item < ActiveRecord::Base
  
  belongs_to :categories
  belongs_to :user
  belongs_to :group

  
  validates :name, presence: true
  validates :quantity, {presence: true, numericality: true}
end
