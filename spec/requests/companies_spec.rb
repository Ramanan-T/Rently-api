require 'rails_helper'

RSpec.describe "Companies", type: :request do

  before(:all) do
    @company = FactoryBot.create(:company)
    @agent= FactoryBot.create(:agent,:company_id=>@company.id)
    @agents= FactoryBot.create(:agent,:role=>"Non-admin",:company_id=>@company.id)
  end
  
 
  
    it "Shows the Company information With subagent " do
        sign_in @agent 
        get companies_path
        expect(response.body).to include("Sub Agent Name")
    end

    it "Company information without sub agent" do
      sign_in @agents 
      get companies_path
      expect(response.body).to_not include("Sub Agent Name")
    end
  
    it "New Company " do
    
    get new_company_path
    expect(response).to render_template 'companies/new'
    end 
   


  #checking the action after filling the company creation form 
  context "Redirection after company creation" do

    it "Shows the agent creation form" do
      get new_company_path
      visit new_company_path
      within("#form") do
      fill_in 'Company name', with:"Rently9"
      fill_in 'Company contact', with:"871234"
      fill_in 'Company address', with:"Cakebee"
      
      click_button 'Create Company'
    end
    expect(response).to render_template "companies/admin_agent"
    end 

  end
   
end
