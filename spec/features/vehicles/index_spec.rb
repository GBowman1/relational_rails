require "rails_helper"

describe "Vehicles Index" do
# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)
    describe "As a visitor" do
        it "I can see all vehicles in the system" do
            dealer_1 = Dealership.create!(
                                        review_rating: 4,
                                        days_open: "Monday - Friday",
                                        city: "City 1",
                                        name: "Dealer 1", 
                                        military_discount: true,
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

            visit "/vehicles"


            expect(page).to have_content("Pre-Owned: #{vehicle_1.pre_owned}")
            expect(page).to have_content("Electric: #{vehicle_1.electric}")
            expect(page).to have_content("Price: #{vehicle_1.price}$")
            expect(page).to have_content("Vehicle Year: #{vehicle_1.year}")
            expect(page).to have_content("Horsepower: #{vehicle_1.horsepower}")
            expect(page).to have_content(vehicle_1.make)
            expect(page).to have_content(vehicle_1.model)
            # add dealship name to vehicle card

            # expect(page).to have_content(vehicle_1.img_url)

            expect(page).to have_content("Pre-Owned: #{vehicle_2.pre_owned}")
            expect(page).to have_content("Electric: #{vehicle_2.electric}")
            expect(page).to have_content("Price: #{vehicle_2.price}$")
            expect(page).to have_content("Vehicle Year: #{vehicle_2.year}")
            expect(page).to have_content("Horsepower: #{vehicle_2.horsepower}")
            expect(page).to have_content(vehicle_2.make)
            expect(page).to have_content(vehicle_2.model)
        end
    end
end