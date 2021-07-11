require 'faker'

# hosts = User.create!([
#   {first_name: "Will", last_name: "Petty", email: "pettwil1131@gmail.com", phone_number: "731-217-2221", address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: "https://avatars.githubusercontent.com/u/77342332?v=4", zip_code: Faker::Address.zip_code, host: true},

#   {first_name: "Evan", last_name: "Mallard", email: "evanmallard@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: true},

#   {first_name: "Bentley", last_name: "Widgeon", email: "bentleywidgeon@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: true},

#   {first_name: "Bill", last_name: "Teal", email: "billteal@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: true},

#   {first_name: "Mike", last_name: "Pintail", email: "mikepintail@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: true},

#   {first_name: "Trey", last_name: "Gadwall", email: "treygadwall@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: true},
# ])

# users = User.create!([
#   {first_name: "Mathias", last_name: "Schneider", email: "mathiasschneider@gmail.com",phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Ryan", last_name: "Ball", email: "ryanball@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Vinny", last_name: "Knepper", email: "vinnyknepper@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Andrew", last_name: "Fillmore", email: "andrewfillmore@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Jamie", last_name: "Denvir", email: "jamiedenvir@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Ian", last_name: "Belfatto", email: "ianbelfatto@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Ashley", last_name: "Gahagan", email: "ashleygahagan@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Benjamin", last_name: "Dickson", email: "benjamindickson@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Sophie", last_name: "Fishman", email: "sophiefishman@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Rob", last_name: "George", email: "robgeorge@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Shinan", last_name: "Liao", email: "shinanliao@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Sam", last_name: "Bruce", email: "sambruce@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Katie", last_name: "Tensfeldt", email: "katietensfeldt@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false},

#   {first_name: "Ben", last_name: "McFadden", email: "benmcfadden@gmail.com", phone_number: Faker::PhoneNumber.cell_phone, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, password: "password", password_confirmation: "password", about_me: Faker::Hipster.paragraph(sentence_count: 4), image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['people']), zip_code: Faker::Address.zip_code, host: false}
# ])

# 40.times do
#   locations = ["752 State Hwy 306, Earle, AR 72331, USA", "647 Co Rd 806, Parkin, AR 72373, USA", "127 McCoy Rd, Stuttgart, AR 72160", "1131 Harbor River Cove, Memphis, TN, 38103", "1162 Isle View Dr, Memphis, TN 38103", "27890 White Rd, Trumann, AR 72472"]

#   Listing.create({user_id: hosts.sample.id, title: Faker::Commerce.department(max: 5, fixed_amount: true), description: Faker::Hipster.paragraph(sentence_count: 6), address: locations.sample, availability: Faker::Date.between(from: '2021-11-26', to: '2022-01-31'), price: "150/day without a guide, $250/day with a guide."})
# end

# 240.times do
#   listings = Listing.all
#   Image.create({listing_id: listings.sample.id, url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['animals'])})
# end

# listings = Listing.all
# listings.each do |listing|
#   coordinates = Geocoder.search(listing.address).first.coordinates
#   listing.update(
#     latitude: coordinates[0],
#     longitude: coordinates[1],
#   )
# end

# 57.times do
#   users = User.all
#   PersonalUrl.create!({user_id: users.sample.id, personal_url: Faker::Internet.url})
# end