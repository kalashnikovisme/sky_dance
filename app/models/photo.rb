class Photo < ActiveRecord::Base
  attr_accessible :photo,
                  :teacher_id

  belongs_to :teacher

  validates :photo, presence: true
  validates :teacher_id, presence: true

  mount_uploader :photo, PhotoUploader
end
