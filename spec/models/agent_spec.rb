require 'rails_helper'

RSpec.describe Agent, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @company=FactoryBot.create(:company)
  end

  it "Agent has been created and Email Validated" do
    result = FactoryBot.create(:agent,company_id:@company.id)
    expect(result).to be_valid
  end 
end
