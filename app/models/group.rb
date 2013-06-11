class Group < ActiveRecord::Base
  extend Enumerize

  attr_accessible :once_price,
                  :price,
                  :space_group

  enumerize :space_group, in: [:there_places, :there_not_places, :group_formed],
                          default: :there_places

  belongs_to :genre
  belongs_to :teacher
  belongs_to :category

  validates :once_price, presence: true
  validates :price, presence: true
  validates :space_group, presence: true
end
