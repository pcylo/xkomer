FactoryGirl.define do
  factory :offer do
    name         Faker::Lorem.words(4)
    old_price    "579,00 zł"
    new_price    "499,00 zł"
    discount     "80 zł"
    product_code Random.rand(99999)

    initialize_with { new(attributes) }
    to_create { |instance| OfferRepository.new.create(instance) }
  end
end
