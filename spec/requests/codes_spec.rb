require 'rails_helper'

RSpec.describe "Codes", type: :request do

  before do
    @company=FactoryBot.create(:company)
    @property= FactoryBot.create(:property,:company_id=>@company.id)
    @smartlock = FactoryBot.create(:smartlock,:property_id=>@property.id,:company_id=>@company.id)
      @code = FactoryBot.create(:code,:smartlock_id=>@smartlock.id)
      @agent= FactoryBot.create(:agent,company_id:@company.id)
  end 
  
    it "New page for code" do
        sign_in @agent
        get new_code_path
        expect(response).to render_template 'codes/new'
    end 

    it "Codes index page" do
      sign_in @agent
      get codes_path(:property_id=>@property.id)
      expect(response).to render_template 'codes/index'
  end 

  it "Delete the Code" do
    sign_in @agent
    delete code_path(:id=>@code.id)
    expect(response).to redirect_to properties_path
  end 
  
end
