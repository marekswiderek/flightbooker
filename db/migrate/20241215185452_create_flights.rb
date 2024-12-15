class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.references :departure_airport, index: true, null: false, foreign_key: { to_table: :airports }
      t.references :arrival_airport, index: true, null: false, foreign_key: { to_table: :airports }
      t.datetime :departure_time, null: false
      t.time :duration, null: false
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
