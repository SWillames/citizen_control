class Address < ApplicationRecord
  belongs_to :citizen

  validates :zip_code, :street, :district, :city, :UF, presence: true
end
