require 'rails_helper'

RSpec.describe Property, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @company=FactoryBot.create(:company)
    @property=FactoryBot.create(:property,:company_id=>@company.id)
  end 

  it "Does image validation and Save check" do
    result = @property.images.attached?

    expect(result).to eq(true)
  end 
end
