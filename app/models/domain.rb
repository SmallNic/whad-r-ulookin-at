class Domain < ApplicationRecord
  has_many :visits
  belongs_to :user
end
