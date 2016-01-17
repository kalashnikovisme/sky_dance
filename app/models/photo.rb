class Photo < ActiveRecord::Base
  belongs_to :teacher

  validates :photo, presence: true
  validates :teacher_id, presence: true

  mount_uploader :photo, PhotoUploader
end
