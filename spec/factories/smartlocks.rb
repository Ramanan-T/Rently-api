FactoryBot.define do
  factory :smartlock do

    serial_num {Faker::Number.between(from: 99999, to: 1000000)}
    property_id {""}
    company_id {""}
    
  end
end
