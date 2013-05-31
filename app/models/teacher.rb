class Teacher < ActiveRecord::Base
  attr_accessible :description, :first_name, :middle_name, :motto
  
  has_many :teacher_photos, :dependent => :destroy
end

class TeacherPhoto < ActiveRecord::Base
  attr_accessible :teacher_id

  belongs_to :teacher
  has_attached_file :photo
  validates :photo, :presence => true
end
