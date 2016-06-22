class CreateBedrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :bedrooms do |t|
      t.integer :number
      t.integer :beds
      t.references :bedroomType, foreign_key: true

      t.timestamps
    end
  end
end
