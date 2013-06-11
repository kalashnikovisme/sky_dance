class Genre < ActiveRecord::Base
  attr_accessible :description, :photo, :title, :video_link
end
