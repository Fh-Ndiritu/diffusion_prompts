FactoryBot.define do
  factory :dataset do
    name { Faker::TvShows::GameOfThrones.city }
    data_type { ["string", "bool", "large_string", "binary", "large_binary", "float16", "timestamp"].sample }
    language { ["Spanish", "English", "Swahili", "German", "Dutch", "Chinese", "Hindu"].sample }
    source { "https:://" << Faker::Internet.domain_name << Faker::Internet.slug}
  end
end
