require "rails_helper"

describe "Dealerships Edit" do
    describe "As a visitor" do
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

            fill_in 'dealershipName', with: 'Bobs Used Cars'
            fill_in 'inputCity', with: 'San Marcos'
            fill_in 'daysOpen', with: 'Monday - Friday'
            fill_in 'inputRating', with: 4
            check 'militaryDiscount'

            click_button 'Submit Changes'

            expect(current_path).to eq("/dealerships")
            expect(page).to have_content('Bobs Used Cars')
            expect(page).to have_content('San Marcos')
        end
    end
end