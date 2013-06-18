class Video < ActiveRecord::Base
  attr_accessible :link,
                  :genre_id

  belongs_to :genre

  #FIXME
  validates :link, presence: true
  #                 url: true
end
