FactoryBot.define do
  factory :agent do
    name {"Ramanan"}
    email {Faker::Internet.email} 
    password {"123456"} 
    password_confirmation {"123456"} 
    role {"Admin"}
    phone {9843376722}
    company_id {" "}
  end
end
