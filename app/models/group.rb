class Group < ActiveRecord::Base
  extend Enumerize
  enumerize :space, in: [:there_places,
                         :there_not_places,
                         :group_formed],
                          default: :there_places

  belongs_to :genre
  belongs_to :teacher
  belongs_to :category
  has_many :lessons, dependent: :destroy

  validates :space, presence: true
  validates :genre_id, presence: true
  validates :teacher_id, presence: true
  validates :category_id, presence: true
end
