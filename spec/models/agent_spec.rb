require 'rails_helper'

RSpec.describe Agent, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
    dummy_pwd = 'password'
    dummy_email = 'tester@example.com'
  before do
    @company=FactoryBot.create(:company)
  end

  it "Agent has been created and Email Validated" do
    result = FactoryBot.create(:agent,company_id:@company.id)
    expect(result).to be_valid
  end 

  context "Agent Validations" do

    it "Has a email" do
      @agent = FactoryBot.build(:agent,email:"sdfgfg",company_id:@company.id)
      @agent.email = ""
      expect(@agent).to_not be_valid
      @agent = FactoryBot.build(:agent,company_id:@company.id)
      expect(@agent).to be_valid
    end

    it "Has valid format" do
      @agent = FactoryBot.build(:agent,company_id:@company.id,email:"admin..")
    expect(@agent).to_not be_valid
    @agent = FactoryBot.build(:agent,company_id:@company.id,email:dummy_email)
    expect(@agent).to be_valid
  end

  it "Has password at least 6 characters long" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,password:"pass",password_confirmation:"pass")
    expect(@agent).to_not be_valid
    @agent = FactoryBot.build(:agent,company_id:@company.id,password:"password",password_confirmation:"password")
    expect(@agent).to be_valid
  end

 

  it "Has a name" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,name:nil)
    expect(@agent).to_not be_valid
    @agent = FactoryBot.build(:agent,company_id:@company.id,name:"Anush")
    expect(@agent).to be_valid
  end

  it "Has a role" do
    @agent = FactoryBot.build(:agent,company_id:@company.id,role:nil)
    expect(@agent).to_not be_valid
    @agent = FactoryBot.build(:agent,company_id:@company.id,role:"Admin")
    expect(@agent).to be_valid
  end



  end


  context "Callbacks" do  
   
      it { is_expected.to callback(:send_subagent_email).after(:create) }
     
  end
end
