class Admin < ActiveRecord::Base
  validates :login, presence: true
  validates :password, presence: true

  def authenticate(pass)
    password == pass
  end
end
