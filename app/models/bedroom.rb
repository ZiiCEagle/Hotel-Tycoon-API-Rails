class Bedroom < ApplicationRecord
  belongs_to :bedroomType

  has_one :reservation
  has_one :customer, through: :reservation

  validates :number,
            presence: true,
            uniqueness: true,
            numericality: true
  validates :beds,
            presence: true,
            numericality: true

  def as_json(options = {})
    super(options.merge({
      include: {
        bedroomType: { only: [:id, :name] },
        customer: {},
        reservation: {}
      }
    }))
  end

end
