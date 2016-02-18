class Contact < ActiveRecord::Base
  validates :comment, comment: true
  validates :name, human_name: true
  validates :phone, phone: true
end
