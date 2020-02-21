FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_furigana        {"タナカ"}
    last_furigana         {"タロウ"}
    birthday              {Date.new(2000, 11, 12)}
    email                 {"kkk@gmail.com"}
    password              {"000000a"}
    password_confirmation {"000000a"}
  end

end