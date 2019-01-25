class Bidding < ApplicationRecord
  validates_uniqueness_of :external_code
end
