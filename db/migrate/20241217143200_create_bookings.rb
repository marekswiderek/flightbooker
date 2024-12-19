class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: { to_table: :flights }
      t.boolean :payment_verified, default: false

      t.timestamps
    end
  end
end
