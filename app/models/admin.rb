class Admin < ActiveRecord::Base
  validates :login, presence: true
  validates :password, presence: true
end
