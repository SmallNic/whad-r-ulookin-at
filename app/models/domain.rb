class Domain < ApplicationRecord
  has_many :visits
  belongs_to :user

  validates :name, presence: true
  
end
