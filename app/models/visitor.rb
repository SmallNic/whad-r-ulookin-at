class Visitor < ApplicationRecord
  has_many :visits

  validates :ip_address, presence: true, uniqueness: true

end
