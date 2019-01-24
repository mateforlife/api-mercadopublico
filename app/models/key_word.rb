class KeyWord < ApplicationRecord
  validates :name, uniqueness: true, presence: true
end
