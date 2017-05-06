FactoryGirl.define do
  factory :offer do
    name         Faker::Lorem.words(4)
    old_price    "579,00 zł"
    new_price    "499,00 zł"
    discount     "80 zł"
    product_code Random.rand(99999)
    # tags      [Faker::Lorem.word, Faker::Lorem.words(2), Faker::Lorem.words(3)]
    # quantity  Random.rand(200)
    # image_url "https://cdn.x-kom.pl/i/img/promotions/hot-shot,,hs_xxx.PNG"

    initialize_with { new(attributes) }
    to_create { |instance| OfferRepository.new.create(instance) }
  end
end
