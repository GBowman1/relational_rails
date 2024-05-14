require "rails_helper"

describe "Dealerships Vehicles Index" do
# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

    describe "As a visitor" do
        it "I can see all vehicles associated with a dealership" do
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

            expect(page).to have_content("Pre-Owned: #{vehicle_1.pre_owned}")
            expect(page).to have_content("Electric: #{vehicle_1.electric}")
            expect(page).to have_content("Price: #{vehicle_1.price}$")
            expect(page).to have_content("Vehicle Year: #{vehicle_1.year}")
            expect(page).to have_content("Horsepower: #{vehicle_1.horsepower}")
            expect(page).to have_content(vehicle_1.make)
            expect(page).to have_content(vehicle_1.model)

            expect(page).to have_content("Pre-Owned: #{vehicle_2.pre_owned}")
            expect(page).to have_content("Electric: #{vehicle_2.electric}")
            expect(page).to have_content("Price: #{vehicle_2.price}$")
            expect(page).to have_content("Vehicle Year: #{vehicle_2.year}")
            expect(page).to have_content("Horsepower: #{vehicle_2.horsepower}")
            expect(page).to have_content(vehicle_2.make)
            expect(page).to have_content(vehicle_2.model)

            expect(page).to_not have_content(vehicle_3.make)
            expect(page).to_not have_content(vehicle_3.model)

        end
        # User Story 7, Parent Child Count

        # As a visitor
        # When I visit a parent's show page
        # I see a count of the number of children associated with this parent
        it 'can show the number of vehicles at the bottom of the page' do
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

            expect(page).to have_content("Showing #{dealer_1.vehicles.count} Vehicles")
        end
        # User Story 13, Parent Child Creation 

        # As a visitor
        # When I visit a Parent Children Index page
        # Then I see a link to add a new adoptable child for that parent "Create Child"
        # When I click the link
        # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
        # When I fill in the form with the child's attributes:
        # And I click the button "Create Child"
        # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
        # a new child object/row is created for that parent,
        # and I am redirected to the Parent Childs Index page where I can see the new child listed
        it 'has a link to add a new vehicle' do
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
            expect(current_path).to eq("/dealerships/#{dealer_1.id}/vehicles")
        end
    end
end