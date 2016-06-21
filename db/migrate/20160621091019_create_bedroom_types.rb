class CreateBedroomTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :bedroom_types do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
