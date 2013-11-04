class OfficeMap < ActiveRecord::Base
  attr_accessible :link

  validates :link, presence: true,
                   url: true
end
