FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
    item_name      {"aaa"}
    exp            {"aaa"}
    category_id    {1}
    status_id      {1}
    send_burden_id {1}
    send_area_id   {1}
    send_day_id    {1}
    price          {400}
    association :user
  end
end