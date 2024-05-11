require "rails_helper"

describe "Dealerships Show" do
# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)
    describe "As a visitor" do
        it "when i visit /dealerships/:id i can see a dealership and its attributes" do
            dealer_1 = Dealership.create!(
                                        review_rating: 4,
                                        days_open: "Monday - Friday",
                                        city: "City 1",
                                        name: "Dealer 1", 
                                        military_discount: true,
                                        created_at: Time.now,  
                                        updated_at: Time.now
            )
            dealer_2 = Dealership.create!(
                                        review_rating: 3,
                                        days_open: "Monday - Friday",
                                        city: "City 2",
                                        name: "Dealer 2",
                                        military_discount: false,
                                        created_at: Time.now,
                                        updated_at: Time.now
            )
            visit "/dealerships/#{dealer_1.id}"

            expect(page).to have_content(dealer_1.name)
            expect(page).to have_content("location: #{dealer_1.city}")
            expect(page).to have_content("provides military discount: #{dealer_1.military_discount}")
            expect(page).to have_content("days open: #{dealer_1.days_open}")
            expect(page).to have_content("rating: #{dealer_1.review_rating}")

            # Make sure page isnt displaying other dealerships
            expect(page).to_not have_content(dealer_2.name)
            # expect(page).to_not have_content("location: #{dealer_2.city}")
            # expect(page).to_not have_content("provides military discount: #{dealer_2.military_discount}")
            # expect(page).to_not have_content("days open: #{dealer_2.days_open}")
            # expect(page).to_not have_content("rating: #{dealer_2.review_rating}")
        end
        it 'has a link to the dealerships vehicles index' do
            dealer_1 = Dealership.create!(
                                        review_rating: 4,
                                        days_open: "Monday - Friday",
                                        city: "City 1",
                                        name: "Dealer 1", 
                                        military_discount: true,
                                        created_at: Time.now,  
                                        updated_at: Time.now
            )
            dealer_2 = Dealership.create!(
                                        review_rating: 5,
                                        days_open: "Monday - Saturday",
                                        city: "City 2",
                                        name: "Dealer 2",
                                        military_discount: false,
                                        created_at: Time.now,
                                        updated_at: Time.now
            )

            visit "/dealerships/#{dealer_1.id}"

            expect(page).to have_link("View #{dealer_1.name} Inventory")

            click_link("View #{dealer_1.name} Inventory")
            expect(current_path).to eq("/dealerships/#{dealer_1.id}/vehicles")

            visit "/dealerships/#{dealer_2.id}"

            expect(page).to have_link("View #{dealer_2.name} Inventory")
            click_link("View #{dealer_2.name} Inventory")
            expect(current_path).to eq("/dealerships/#{dealer_2.id}/vehicles")
        end
    end
end