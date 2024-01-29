namespace :huggingface do 

  desc "fetches prompts from hugging face"
  task fetch_prompts: :environment do 
    puts "cleaning tables"
    tables =%w[datasets splits prompts]
    tables.each do |table|
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table} RESTART IDENTITY CASCADE;")
    end

    puts "adding dataset and splits"
    dataset = Dataset.new(
      name: "Gustavosta - Stable Diffusion Prompts",
      data_type: "string",
      language: "English", 
      source: "https://datasets-server.huggingface.co/rows?dataset=Gustavosta%2FStable-Diffusion-Prompts"
    )
    exit unless dataset.save 
    dataset.splits.find_or_create_by(name: "test")
    dataset.splits.find_or_create_by(name: "train")
    LoadHfPromptsJob.perform_later(dataset)

  end

end
  