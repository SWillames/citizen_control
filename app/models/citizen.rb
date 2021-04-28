class Citizen < ApplicationRecord
  has_one :address
  STATUS = %w[enabled disabled]


  validates :full_name, :cpf, :birth_date, :email, :telephone, presence: true
  validates :cpf, :email, uniqueness: true
  validates_format_of :email, with: EMAIL_FORMAT
  validates_format_of :cpf, with: /\A.[0-9]+\z/
  validates_length_of :cpf, is: 11
  validates :status, presence: true, inclusion: { in: STATUS }

end
