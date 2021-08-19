require 'rails_helper'

RSpec.describe Smartlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    before do
      @smartlock= FactoryBot.create(:smartlock)
    end 

    it "Smartlock Created with unqiue Serial Number" do
      expect(@smartlock).to be_valid
    end
end
