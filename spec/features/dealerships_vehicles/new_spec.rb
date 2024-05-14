require "rails_helper"

describe "Dealerships Vehicles New" do
    describe "As a visitor" do
        it "can create a new vehicle for a dealership" do
            dealer_1 = Dealership.create!(
                                        review_rating: 4,
                                        days_open: "Monday - Friday",
                                        city: "City 1",
                                        name: "Dealer 1", 
                                        military_discount: true,
                                        created_at: Time.now,  
                                        updated_at: Time.now,
            )
            dealer_2 = Dealership.create!(
                                        review_rating: 3,
                                        days_open: "Monday - Saturday",
                                        city: "City 2",
                                        name: "Dealer 2",
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

            visit "/dealerships/#{dealer_1.id}/vehicles"

            expect(page).to have_link("Add New Vehicle")
            click_link("Add New Vehicle")
            expect(current_path).to eq("/dealerships/#{dealer_1.id}/vehicles/new")

            check "pre_owned"
            uncheck "electric"
            fill_in "price", with: 25000
            fill_in "year", with: 2013
            fill_in "horsepower", with: 250
            fill_in "make", with: "Chevy"
            fill_in "model", with: "Silverado"
            fill_in "img_url", with: "https://cars.usnews.com/pics/size/640x420/images/Auto/custom/15265/2024_Chevrolet_Silverado_1500_ZR2_1.jpg"

            click_button "Create Vehicle"

            expect(current_path).to eq("/dealerships/#{dealer_1.id}/vehicles")
            expect(page).to have_content("Chevy")
            expect(page).to have_content("Silverado")
            
        end
    end
end