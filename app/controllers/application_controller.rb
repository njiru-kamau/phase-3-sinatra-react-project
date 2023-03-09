get "/" do
  { message: "Welcome to our booking app!" }.to_json
end

# get all bookings
get "/bookings" do
  bookings = Booking.all
  bookings.to_json
end

# get a specific booking and its associated details
get '/bookings/:id' do
  booking = Booking.find(params[:id])
  {
    booking: booking,
    customer: booking.customer,
    room: booking.room
  }.to_json
end

# create a new booking
post "/bookings" do
  customer = Customer.create(
    name: params[:customer_name],
    email: params[:customer_email],
    phone_number: params[:customer_phone_number]
  )

  room = Room.find_by(room_number: params[:room_number])

  if room && room.is_available?(params[:check_in], params[:check_out])
    booking = Booking.create(
      check_in: params[:check_in],
      check_out: params[:check_out],
      customer_id: customer.id,
      room_id: room.id
    )

    {
      "message": "Booking created successfully",
      "status": "HTTP_200_OK",
      "booking": booking,
      "customer": customer,
      "room": room
    }.to_json
  else
    {
      "message": "The room is not available for the selected dates",
      "status": "HTTP_422_UNPROCESSABLE_ENTITY"
    }.to_json
  end
end

# delete a booking
delete "/bookings/:id" do
  booking = Booking.find_by(id: params[:id])
  if booking
    booking.destroy
    {
      "message": "Booking deleted successfully",
      "status": "HTTP_200_OK"
    }.to_json
  else
    {
      "message": "Booking not found",
      "status": "HTTP_404_NOT_FOUND"
    }.to_json
  end
end
