class CreatePassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :passengers do |t|
      t.references :booking, null: false, foreign_key: { to_table: :bookings }
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
