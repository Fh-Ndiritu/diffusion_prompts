tables =%w[datasets splits prompts]
tables.each do |table|
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
end

3.times do 
    dataset = FactoryBot.create(:dataset)
    split = FactoryBot.create(:split, dataset: dataset)
    6.times do 
        FactoryBot.create(:prompt, split: split)
    end
end
