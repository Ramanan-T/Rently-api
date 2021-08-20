FactoryBot.define do
  factory :code do
    code {Faker::Number.between(from: 99999, to: 1000000)}
    smartlock_id {""}
  end
end
