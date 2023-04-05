FactoryBot.define do

  factory :user do
    nickname              {"hode"}
    email                 {"hoge@hoge"}
    password              {"hoge11"}
    password_confirmation {"hoge11"}
    first_name            {"山田"}
    first_name_kana       {"ヤマダ"}
    last_name             {"山田"}
    last_name_kana        {"タロウ"}
    birthday              {"2000-01-01"}
  end
end