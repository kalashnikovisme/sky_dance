class News < ActiveRecord::Base
  attr_accessible :body,
                  :photo,
                  :published_at,
                  :title

  validates :body, presence: true
  validates :published_at, presence: true
  validates :title, presence: true,
                    length: { maximum: 70 }

  mount_uploader :photo, PhotoUploader
end
