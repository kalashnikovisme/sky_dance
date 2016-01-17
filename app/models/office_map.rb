class OfficeMap < ActiveRecord::Base
  validates :link, presence: true,
                   url: true
end
