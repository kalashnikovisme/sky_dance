class Category < ActiveRecord::Base
  attr_accessible :describe

  has_many :groups

  validates :describe, presence: true
end
