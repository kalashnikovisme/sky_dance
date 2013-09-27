class Unlimit < ActiveRecord::Base
  attr_accessible :price, :name

  validates :price, presence: true
  validates :name, presence: true
end
