FactoryBot.define do
  factory :prompt do
    split 
    row_idx { rand(1..100_000) }
    content { Faker::TvShows::GameOfThrones.quote }
    truncated_cells { "" }
    partial { [true, false].sample }
  end
end
