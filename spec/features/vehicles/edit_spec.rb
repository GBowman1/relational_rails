require "rails_helper"

describe "Vehicles Edit" do
    describe "As a visitor" do
    # User Story 14, Child Update 

    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
        it "can update a vehicle for a dealership" do
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

            visit "/vehicles/#{vehicle_1.id}"

            expect(page).to have_link("Edit #{vehicle_1.make} #{vehicle_1.model}")
            click_link "Edit #{vehicle_1.make} #{vehicle_1.model}"

            expect(current_path).to eq("/vehicles/#{vehicle_1.id}/edit")

            check "pre_owned"
            fill_in "price", with: 25000
            fill_in "year", with: 2024
            fill_in "horsepower", with: 300
            fill_in "make", with: "Chevy"
            fill_in "model", with: "Silverado"
            fill_in "img_url", with: "https://cars.usnews.com/pics/size/640x420/images/Auto/custom/15265/2024_Chevrolet_Silverado_1500_ZR2_1.jpg"

            click_button "Update Vehicle"

            expect(current_path).to eq("/vehicles/#{vehicle_1.id}")
            expect(page).to have_content("Chevy")
            expect(page).to have_content("Silverado")
        end
    end
end