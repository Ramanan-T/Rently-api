FactoryBot.define do
  factory :property do
    property_name {"Sevilla Home"}
    property_address {"ddvdv"}
    property_price {"1233"}
    property_desc {"kdfjfkdf"}
    company_id {120}

    after(:build) do |culture|
      culture.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'soy.jpeg')), filename: 'soy.jpeg', content_type: 'image/jpeg')
    end 
  end
end
