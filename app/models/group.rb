class Group < ActiveRecord::Base
  attr_accessible :category,
                  :once_price,
                  :price

  belongs_to :genre
  belongs_to :teacher

  validates :category, presence: true
  validates :once_price, presence: true
  validates :price, presence: true
end
