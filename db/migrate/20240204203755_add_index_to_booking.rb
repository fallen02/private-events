class AddIndexToBooking < ActiveRecord::Migration[7.1]
  def change
    add_index :bookings, [:attended_event_id, :attendee_id], unique: true
  end
end
