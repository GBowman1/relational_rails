# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
dealer_1 = Dealership.create!(
                            review_rating: 4,
                            days_open: "Monday - Friday",
                            city: "Seguin",
                            name: "Seguin Chevrolet", 
                            military_discount: true,
                            created_at: Time.now,  
                            updated_at: Time.now,
)
dealer_2 = Dealership.create!(
                            review_rating: 5,
                            days_open: "Monday - Saturday",
                            city: "Seguin",
                            name: "Gunn Chrysler Dodge Jeep Ram",
                            military_discount: false,
                            created_at: Time.now,
                            updated_at: Time.now,
)

vehicle_1 = Vehicle.create!(
                            pre_owned: true,
                            electric: false,
                            price: 20000,
                            year: 2012,
                            horsepower: 230,
                            make: "Toyota",
                            model: "Camry",
                            img_url: "https://cars.usnews.com/static/images/Auto/izmo/332536/2012_toyota_camry_angularfront.jpg",
                            dealership: dealer_1
)
vehicle_2 = Vehicle.create!(
                            pre_owned: false,
                            electric: false,
                            price: 30000,
                            year: 2015,
                            horsepower: 300,
                            make: "Ford",
                            model: "F-150",
                            img_url: "https://cars.usnews.com/static/images/Auto/izmo/i2314306/2015_ford_f_150_angularfront.jpg",
                            dealership: dealer_1
)
vehicle_3 = Vehicle.create!(
                            pre_owned: true,
                            electric: false,
                            price: 25000,
                            year: 2013,
                            horsepower: 250,
                            make: "Chevy",
                            model: "Silverado",
                            img_url: "https://file.kelleybluebookimages.com/kbb/base/evox/CP/8211/2013-Chevrolet-Silverado%201500%20Crew%20Cab-front_8211_032_1844x820_GHA_cropped.png",
                            dealership: dealer_2
)
