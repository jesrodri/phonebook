class Phone < ApplicationRecord
  belongs_to :contact

  validates :number, presence: true, uniqueness: { scope: :contact }
  validates :number_type, inclusion: {in: %w(cellphone home work other), message: 'Choose number type between: cellphone / home / work / other.'}
  validates :main_number, uniqueness: true, if: :main_number==true
end
