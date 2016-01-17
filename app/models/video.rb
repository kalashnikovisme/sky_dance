class Video < ActiveRecord::Base
  belongs_to :genre

  validates :link, presence: true,
                   url: true
  validates :genre, presence: true
end
