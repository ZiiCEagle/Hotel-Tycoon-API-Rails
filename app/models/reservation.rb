class Reservation < ApplicationRecord
  belongs_to :bedroom
  belongs_to :customer

  validates_presence_of :start_date, :end_date
end
