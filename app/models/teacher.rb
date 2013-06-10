class Teacher < ActiveRecord::Base
  attr_accessible :description,
                  :first_name,
                  :middle_name,
                  :motto

  has_many :photos

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :description, presence: true
  validates :motto, presence: true,
                    length: { maximum: 140 }
end
