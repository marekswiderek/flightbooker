class CreatePassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :passengers, id: false do |t|
      t.string :passport_no
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end

    reversible do |direction|
      direction.up do
        #execute SQL DDL query to SET PRIMARY KEY to avoid creating a sequence on passport_no column
        execute <<-SQL
          ALTER TABLE passengers ADD PRIMARY KEY (passport_no);
        SQL
      end
      direction.down do
        #revert UP action
        execute <<-SQL
          ALTER TABLE passengers DROP CONSTRAINT passengers_pkey;
        SQL
      end
    end

  end
end
