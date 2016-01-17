class Teacher < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :groups

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :description, presence: true
  validates :motto, presence: true,
                    length: { maximum: 140 }
end
