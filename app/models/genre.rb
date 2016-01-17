class Genre < ActiveRecord::Base
  validates :description, presence: true
  validates :title, presence: true
  validates :photo, presence: true

  has_many :videos, dependent: :destroy
  has_many :groups, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
