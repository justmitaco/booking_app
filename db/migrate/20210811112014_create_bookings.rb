class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :image
      t.string :name
      t.text :introduction
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.integer :person
      t.integer :total_days
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
