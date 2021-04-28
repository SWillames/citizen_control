class State < ApplicationRecord
  validates_presence_of :name, :abbr
  validates :abbr, :length => { :is => 2 }
end
