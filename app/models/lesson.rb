class Lesson < ActiveRecord::Base
  extend Enumerize

  attr_accessible :day, :time

  enumerize :day, in: [:monday,
                       :tuesday,
                       :wednesday,
                       :thursday,
                       :friday,
                       :saturday,
                       :sunday],
                  default: :monday

  belongs_to :group

  validates :day, presence: true
  validates :time, presence: true
end
