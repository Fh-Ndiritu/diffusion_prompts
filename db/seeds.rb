

3.times do 
    dataset = FactoryBot.create(:dataset)
    FactoryBot.create(:split, dataset: dataset)
end
