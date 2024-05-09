require "rails_helper"

describe Dealership do
    describe 'relationships' do
        it { should have_many :vehicles } 
    end
    # User Story 6, Parent Index sorted by Most Recently Created 

    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    describe 'class methods' do
        it "can sort dealerships by most recently created" do
            
        end
        it 'shoes when the dealership was created' do
        end
    end
end