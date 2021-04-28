class Address < ApplicationRecord
  belongs_to :city
  belongs_to :citizen

  validates :zip_code, :street, :district, :city_id, :UF, presence: true
end
