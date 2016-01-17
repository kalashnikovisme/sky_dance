class Lesson < ActiveRecord::Base
  extend Enumerize

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
  validates :group_id, presence: true
end
