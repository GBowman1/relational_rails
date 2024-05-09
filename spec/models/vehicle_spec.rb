require "rails_helper"

describe Vehicle do
    describe 'relationships' do
        it { should belong_to :dealership } 
    end
end