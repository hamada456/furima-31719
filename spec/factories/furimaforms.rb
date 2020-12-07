FactoryBot.define do
  factory :furimaform do
    post         { '000-0000' }
    send_area_id { 1 }
    city         { 'a' }
    block        { 'a' }
    tel          { '09012345678' }
    token        { 'a01B' }
    build        { 'aー１ビル'}
  end
end
