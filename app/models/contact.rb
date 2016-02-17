class Contact < ActiveRecord::Base
  validates :email, email: true
  validates :name, human_name: true
  validates :phone, phone: true
end
