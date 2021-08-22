
    

FactoryBot.define do
  factory :checkin do
    serial_code {Faker::Number.between(from: 99999, to: 1000000)}
    property_id {""}
    renter_id {""}
  end
end


