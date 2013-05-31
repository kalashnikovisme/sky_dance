class Teacher < ActiveRecord::Base
  attr_accessible :description, :first_name, :middle_name, :motto
  
  has_many :teacher_photos, :dependent => :destroy
end
