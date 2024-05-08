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
            expect(page).to have_content("location: #{dealer_1.city}")
        end
    end
end