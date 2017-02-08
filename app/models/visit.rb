class Visit < ApplicationRecord
  belongs_to :domain
  belongs_to :visitor

  validates :domain, :visitor, :url, :browser, :new_visit, presence:true

end
