puts "🌱 Seeding spices..."

# Seed your database here
Listing.delete_all
Booking.delete_all
User.delete_all

user1 = User.create(name: "John Doe", email: "johndoe@example.com", password: "password123")

listing1 = Listing.create(title: "Cozy apartment in the heart of Paris", description: "Beautifully decorated and fully equipped apartment located in the heart of Paris. Perfect for couples or solo travelers.", price_per_night: 120, address: "Rue de Rivoli, Paris", max_guests: 2, user_id: user1.id)

listing2 = Listing.create(title: "Luxury villa in Bali", description: "Stunning villa with breathtaking ocean views, private pool, and 24-hour butler service. Perfect for a romantic getaway or a family vacation.", price_per_night: 500, address: "Jalan Raya Petitenget, Bali", max_guests: 8, user_id: user1.id)

booking1 = Booking.create(check_in_date: Date.new(2023, 5, 1), check_out_date: Date.new(2023, 5, 7), total_price: 840, num_of_guests: 2, user_id: user1.id, listing_id: listing1.id)

booking2 = Booking.create(check_in_date: Date.new(2023, 6, 15), check_out_date: Date.new(2023, 6, 25), total_price: 4000, num_of_guests: 8, user_id: user1.id, listing_id: listing2.id)

puts "✅ Done seeding!"
