class Bidding < ApplicationRecord
  validates_uniqueness_of :external_code

  def self.search(param)
    Bidding.where('lower(name) LIKE ?', "%#{param}%")
  end
end
