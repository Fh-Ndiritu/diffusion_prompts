tables =%w[datasets splits prompts]
tables.each do |table|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
end

3.times do 
    dataset = FactoryBot.create(:dataset)
    FactoryBot.create(:split, dataset: dataset, name: "test")
    FactoryBot.create(:split, dataset: dataset, name: "train")
    dataset.splits.each do |split|
        10.times do  
            FactoryBot.create(:prompt, split: split)
        end
    end
end

Prompt.reindex
