require 'rails_helper'

RSpec.describe "Api V1 Smartlocks", type: :request,oauth: true do
   

	before(:all) do
		@company=FactoryBot.create(:company)
		@smartlock=FactoryBot.create(:smartlock,:company_id=>@company.id)
		
	  end

	  context 'unauthorized' do
		  it "should 401" do
			get '/api/v1/smartlock'
			expect(response).to have_http_status(:unauthorized)
		  end
	  end
	  
	  context 'authorized' do
		let(:application) { FactoryBot.create(:application) }
		let(:agent)        { FactoryBot.create(:agent,company_id:@company.id) }
		let(:token)       { FactoryBot.create(:access_token, application: application, resource_owner_id: agent.id) }
	
		it 'show the Index Page of smartlock' do
		  get '/api/v1/smartlock', headers: { 'Authorization': 'Bearer ' + token.token }
		  
		  expect(response).to be_successful
		end	


		#Checking json Response here
		it 'Shows the details of Specific Smartlock' do
			@expected = { 
				:serial_num  => @smartlock.serial_num,
				:company_id     => @company.id,
        
			}.to_json
			get api_v1_smartlock_path(:id=>@smartlock.id),headers: { 'Authorization': 'Bearer ' + token.token }
			expect(response).to be_successful
	end

		it "List of smartlocks owned by the company" do
			get display_api_v1_smartlock_index_path(:company_id=>@company.id),headers: { 'Authorization': 'Bearer ' + token.token }
			expect(response).to be_successful
		end 

	end
end
