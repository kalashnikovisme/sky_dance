class Lesson < ActiveRecord::Base
  extend Enumerize
  
  attr_accessible :day_of_week, :group, :price, :teacher_id, :time

  enumerize :status, in: [ :places, :not_places, :record_group ], default: :record_group

  belongs_to :teacher
  belongs_to :genre
end
