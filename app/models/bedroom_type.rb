class BedroomType < ApplicationRecord
  validates_presence_of :name, :price
  validates_numericality_of :price
  validates_uniqueness_of :name
end
