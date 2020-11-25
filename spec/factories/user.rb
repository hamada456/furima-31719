FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '00000a' }
    password_confirmation { password }
    first_name            { 'まこ' }
    first_name_kana       { 'マコ' }
    last_name             { 'なり' }
    last_name_kana        { 'ナリ' }
    birthday              { '1930-01-01' }
  end
end
