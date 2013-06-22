class Category < ActiveRecord::Base
  attr_accessible :describe

  has_many :groups, dependent: :destroy

  validates :describe, presence: true
end
