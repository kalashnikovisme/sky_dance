class Contact < ActiveRecord::Base
  validates :name, human_name: true
  validates :phone, phone: true
end
