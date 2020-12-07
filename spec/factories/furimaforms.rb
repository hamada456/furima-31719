FactoryBot.define do
  factory :furimaform do
    post         { '000-0000' }
    send_area_id { 1 }
    city         { 'a' }
    block        { 'a' }
    tel          { '09012345678' }
    # association :buy
    token        { 'a01B' }
  end
end
