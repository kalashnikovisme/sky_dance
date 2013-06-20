class Admin < ActiveRecord::Base
  attr_accessible :login, :password

  validates :login, presence: true
  validates :password, presence: true
end
