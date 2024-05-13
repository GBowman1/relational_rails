require "rails_helper"

describe "Dealerships Index" do
    # User Story 1, Parent Index 
    
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    describe "As a visitor" do
        it 'when I visit /dealerships i can see all dealerships' do
            dealer_1 = Dealership.create!(
                                        review_rating: 4,
                                        days_open: "Monday - Friday",
                                        city: "City 1",
                                        name: "Dealer 1", 
                                        military_discount: true,
                                        created_at: Time.now,  
                                        updated_at: Time.now
            )

            visit '/dealerships'

            expect(page).to have_content(dealer_1.name)
            expect(page).to have_content("Location: #{dealer_1.city}")
        end

        # User Story 6, Parent Index sorted by Most Recently Created 

        # As a visitor
        # When I visit the parent index,
        # I see that records are ordered by most recently created first
        # And next to each of the records I see when it was created
        it 'can see all dealerships sorted by most recently created' do
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

            visit '/dealerships'

            expect(Dealership.all.order(created_at: :desc)).to eq([dealer_2, dealer_1])
        end
        # User Story 7, Parent Child Count

        # As a visitor
        # When I visit a parent's show page
        # I see a count of the number of children associated with this parent
        it 'can show the number of dealerships at the bottom of the page' do
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

            visit '/dealerships'

            expect(page).to have_content("Showing #{Dealership.all.count} Dealerships")
        end
        # User Story 8, Child Index Link

        # As a visitor
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Child Index
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

            visit '/dealerships'

            expect(page).to have_link("View #{dealer_1.name} Inventory")
            expect(page).to have_link("View #{dealer_2.name} Inventory")

            click_link("View #{dealer_1.name} Inventory")
            expect(current_path).to eq("/dealerships/#{dealer_1.id}/vehicles")

            visit '/dealerships'
            click_link("View #{dealer_2.name} Inventory")
            expect(current_path).to eq("/dealerships/#{dealer_2.id}/vehicles")
        end
        it 'has a link to the dealerships show' do
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

            visit '/dealerships'

            expect(page).to have_link("View #{dealer_1.name} Info")
            expect(page).to have_link("View #{dealer_2.name} Info")

            click_link("View #{dealer_1.name} Info")
            expect(current_path).to eq("/dealerships/#{dealer_1.id}")

            visit '/dealerships'
            click_link("View #{dealer_2.name} Info")
            expect(current_path).to eq("/dealerships/#{dealer_2.id}")
        end
        # User Story 12, Parent Update 

        # As a visitor
        # When I visit a parent show page
        # Then I see a link to update the parent "Update Parent"
        # When I click the link "Update Parent"
        # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
        # When I fill out the form with updated information
        # And I click the button to submit the form
        # Then a `PATCH` request is sent to '/parents/:id',
        # the parent's info is updated,
        # and I am redirected to the Parent's Show page where I see the parent's updated info
        it 'can update a dealership' do
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

            visit '/dealerships'

            expect(page).to have_link("Update #{dealer_1.name}")
            click_link("Update #{dealer_1.name}")

            expect(current_path).to eq("/dealerships/#{dealer_1.id}/edit")
            
        end
    end
end