require 'rails_helper'

RSpec.describe "Companies", type: :request do

  before(:all) do
    @company = FactoryBot.create(:company)
    @agent= FactoryBot.create(:agent,:company_id=>@company.id)
    @agents= FactoryBot.create(:agent,:role=>"Non-admin",:company_id=>@company.id)
  end
  
 
  context "Company Index page" do
    it "Shows the Company information " do
        sign_in @agent 
        get companies_url
        expect(response).to render_template 'companies/index'
    end


  end 

  context " Company new Page" do
    it "New Company path" do

    get new_company_path
    expect(response).to render_template 'companies/new'
    end 
  end 
   
end
