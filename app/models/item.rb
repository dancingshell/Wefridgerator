class Item < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :user
  belongs_to :group

  
  validates :name, presence: true
  validates :quantity, {presence: true, numericality: true}
end
