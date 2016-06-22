class Bedroom < ApplicationRecord
  belongs_to :bedroomType
  validates :number,
            presence: true,
            uniqueness: true,
            numericality: true
  validates :beds,
            presence: true,
            numericality: true
end
