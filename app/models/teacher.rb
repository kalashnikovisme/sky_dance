class Teacher < ActiveRecord::Base
  attr_accessible :description,
                  :first_name,
                  :middle_name,
                  :motto,
                  :photo

  has_attached_file :photo
  mount_uploader :photo, PhotoUploader

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :description, presence: true
  validates :motto, presence: true,
                    length: { maximum: 140 }

  def fio
    "#{first_name} #{middle_name}"
  end
end
