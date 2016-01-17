class News < ActiveRecord::Base
  validates :body, presence: true
  validates :published_at, presence: true
  validates :title, presence: true,
                    length: { maximum: 70 }

  mount_uploader :photo, PhotoUploader
end
