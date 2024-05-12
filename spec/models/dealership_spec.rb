require "rails_helper"

describe Dealership do
    describe 'relationships' do
        it { should have_many :vehicles } 
    end
    
    describe 'class methods' do
        it "can sort dealerships by most recently created" do
            
        end
        it 'shoes when the dealership was created' do
        end
    end
end