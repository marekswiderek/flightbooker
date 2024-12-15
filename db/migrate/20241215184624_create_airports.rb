class CreateAirports < ActiveRecord::Migration[7.2]
  def change
    create_table :airports do |t|
      t.string :airport_code, index: { unique: true }, null: false
      t.string :name

      t.timestamps
    end
  end
end
