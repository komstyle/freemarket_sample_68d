FactoryBot.define do
  factory :address do
    postal_code          {"123-4567"}
    address1             {"渋谷区"}
    address2             {"青山１丁目"}
    prefecture_id        {"１"}
    user 
  end
end