class Container < ActiveRecord::Base
  belongs_to :group
  has_many :categories
  has_many :arts
  has_many :receipts
  

end
