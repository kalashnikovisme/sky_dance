class Lesson < ActiveRecord::Base
  extend Enumerize

  attr_accessible :day,
                  :time,
                  :group_id

  enumerize :day, in: [:monday,
                       :tuesday,
                       :wednesday,
                       :thursday,
                       :friday,
                       :saturday,
                       :sunday],
                  default: :monday, multiple: true

  belongs_to :group

  #FIXME
  #validates :day, presence: true
  validates :time, presence: true
  #validates :group_id, presence: true
end
