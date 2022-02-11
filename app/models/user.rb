class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :age, allow_blank: true, numericality: { only_integer: true }
end
