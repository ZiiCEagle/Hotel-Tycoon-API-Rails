class Bedroom < ApplicationRecord
  belongs_to :bedroomType
  validates :number,
            presence: true,
            uniqueness: true,
            numericality: true
  validates :beds,
            presence: true,
            numericality: true

  def as_json(options = {})
    super(options.merge({
      include: { bedroomType: { only: [:id, :name] }}
    }))
  end

end
