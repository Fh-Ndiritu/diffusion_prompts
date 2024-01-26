FactoryBot.define do
  factory :split do
    name { ["train", "test"].sample }
    dataset 
  end
end
