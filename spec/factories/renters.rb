FactoryBot.define do
    factory :renter do
      name {"Ramanan"}
      email {Faker::Internet.email} 
      password {"123456"} 
      password_confirmation {"123456"} 
      
      phone {9843376722}
      
    end
  end
  