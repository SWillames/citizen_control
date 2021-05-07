class Citizen < ApplicationRecord
  has_one :address
  before_validation :only_digit

  STATUS = %w[ativo desativado]

  accepts_nested_attributes_for :address, allow_destroy: true


  validates :full_name, :cpf, :birth_date, :email, :telephone, presence: true
  validates_format_of :full_name, with: FULL_NAME_FORMAT
  validates :cpf, :email, uniqueness: true
  validates_format_of :email, with: EMAIL_FORMAT
  validates_format_of :cpf, with: /\A.[0-9]+\z/
  validates_length_of :cpf, is: 11
  validates :status, presence: true, inclusion: { in: STATUS }
  mount_uploader :image, ImageUploader

  def only_digit
    cpf.gsub!(/[^\d]/, '')
  end
end
