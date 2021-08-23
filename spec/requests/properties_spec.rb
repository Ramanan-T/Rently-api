require 'rails_helper'

RSpec.describe "Properties", type: :request do
  

  before(:all) do
    @company=FactoryBot.create(:company)
    @property= FactoryBot.create(:property,:company_id=>@company.id)
    @smartlock = FactoryBot.create(:smartlock,:property_id=>@property.id,:company_id=>@company.id)
      @code = FactoryBot.create(:code,:smartlock_id=>@smartlock.id)
      @agent= FactoryBot.create(:agent,company_id:@company.id)
      @renter = FactoryBot.create(:renter)
  end 
  it "Renter Properties Index Page" do
    sign_in @renter
    get properties_path

    expect(response).to render_template 'properties/index'

  end
  it "Agent Properties Index Page" do
    sign_in @renter
    get properties_path

    expect(response).to render_template 'properties/index'

  end

  it "Assigning Smartlock" do
    sign_in @agent
    patch property_add_smartlock_path(property_id:@property.id,id:@smartlock.id)
    expect(response).to redirect_to properties_path
  end 


  it "Deletes the Property" do
    sign_in @agent
    delete property_path(:id=>@property.id)

    expect(response).to redirect_to properties_path
  end
  
  
  

end
