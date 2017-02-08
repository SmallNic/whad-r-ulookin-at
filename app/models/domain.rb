class Domain < ApplicationRecord
  has_many :visits
  belongs_to :user

  validates :user, :name, presence: true

end
