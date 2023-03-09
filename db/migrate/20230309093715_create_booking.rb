class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.integer :total_price
      t.belongs_to :user
      t.belongs_to :room

      t.timestamps
    end  
  end
end
