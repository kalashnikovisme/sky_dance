class Genre < ActiveRecord::Base
  attr_accessible :description,
                  :photo,
                  :title

  validates :description, presence: true
  validates :title, presence: true
  validates :photo, presence: true

  has_many :videos, dependent: :destroy
  has_many :groups, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
