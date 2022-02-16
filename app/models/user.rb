class User < ApplicationRecord
  has_many :contacts
  has_many :phones, through: :contacts
  
  validates :name, presence: true, uniqueness: true
  validates :age, allow_blank: true, numericality: { only_integer: true }
end
