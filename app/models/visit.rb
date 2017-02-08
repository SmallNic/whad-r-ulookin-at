class Visit < ApplicationRecord
  belongs_to :domain
  belongs_to :visitor
end
