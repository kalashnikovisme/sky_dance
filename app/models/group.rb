class Group < ActiveRecord::Base
  extend Enumerize

  attr_accessible :once_price,
                  :price,
                  :space,
                  :genre_id,
                  :teacher_id,
                  :category_id


  enumerize :space, in: [:there_places, :there_not_places, :group_formed],
                          default: :there_places

  belongs_to :genre
  belongs_to :teacher
  belongs_to :category
  has_many :lessons, dependent: :destroy

  validates :once_price, presence: true
  validates :price, presence: true
  validates :space, presence: true
  validates :genre_id, presence: true
  validates :teacher_id, presence: true
  validates :category_id, presence: true
end
