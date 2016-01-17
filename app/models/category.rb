class Category < ActiveRecord::Base
  has_many :groups, dependent: :destroy

  validates :describe, presence: true
end
