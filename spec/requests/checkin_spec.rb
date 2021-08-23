require 'rails_helper'

RSpec.describe "Checkins", type: :request do
  
  before do
    @renter = FactoryBot.create(:renter)
    @company=FactoryBot.create(:company)
    @property= FactoryBot.create(:property,:company_id=>@company.id)
    @smartlock = FactoryBot.create(:smartlock,:property_id=>@property.id,:company_id=>@company.id)
    @code = FactoryBot.create(:code,:smartlock_id=>@smartlock.id)
    @checkin= FactoryBot.create(:checkin,:serial_code=>@code.code,:property_id=>@property.id,:renter_id=>@renter.id)
    @agent= FactoryBot.create(:agent,company_id:@company.id)
  end
  context "Renter Property Checkin" do
    it "Request Checkin with correct code" do
    sign_in @renter
    get checkin_new_path(:property_id=>@property.id)
    expect(response).to render_template 'checkin/new'

    end

    it "Request Checkin with wrong code with flash alert" do
      sign_in @renter
      visit checkin_new_path(:property_id=>@property.id) 
      within("#form") do
      fill_in 'Serial code', with:"134"
      
      click_button 'Request Checkin'
    end
      
    # expect(flash[:notice]).to match("Wrong Smartlock Serial number")
    expect(page).to have_content"Wrong Smartlock Serial number"
      end
  end

  
    it "List of checkins for the property" do
      sign_in @agent
      get checkin_path(:property_id=>@property.id)
      expect(response).to render_template 'checkin/index'
    end 

    it "Property Page for renter" do
      sign_in @renter
      get checkin_path(:property_id=>@property.id)
      expect(response).to redirect_to properties_path
    end 


  
end
