class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.string :title
      t.integer :distance

      t.timestamps
    end
  end
end
