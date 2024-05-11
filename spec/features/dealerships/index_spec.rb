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
    end
end