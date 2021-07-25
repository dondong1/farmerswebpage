require 'rails_helper'
require 'spec_helper'
RSpec.describe "InterventionsController", :type => :controller do
    let!(:int){Intervention.new}
    # Testing if the interventions controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end
    # Testing if the interventions controller returns successful response and an actual Intervention object
   
    it "interventions controller should succesfully return an Intervention object' " do
        expect(@response.status).to eq (200)
        expect(int).to_not eq(nil)
        # puts Intervention
    end
end

RSpec.describe "interventions", :type => :feature do
    context "when user goes to the intervention page" do
        it "displays the intervention form after authentification" do
            visit '/users/sign_in'
            fill_in 'Email', with: 'nicolas.genest@codeboxx.biz'
            fill_in 'Password', with: 'codeboxx1' do
            expect(page).to have_text('Intervention')
            end 
        end
    end
end