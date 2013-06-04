class TeacherPhoto < ActiveRecord::Base
  attr_accessible :teacher_id,
                  :photo

  belongs_to :teacher
  has_attached_file :photo

  validates :photo, presence: true
  validates :teacher_id, presence: true
end
