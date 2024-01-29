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

    dataset.splits.each do |split|
      read_csv(split)
    end

  end


  def read_csv(split)
    p split
    puts "filling #{split.name} prompts"
    require 'csv'
    assets_directory = File.join( File.dirname(__FILE__), '../', 'assets')
    prompt_file_path = File.join(assets_directory, "#{split.name}.csv")
    if File.exist?(prompt_file_path)
      csv_data = CSV.read(prompt_file_path, headers: true)

      csv_data.each do |row|
        puts "writing prompt #{row["Row_idx"]}"
        split.prompts.create(
            row_idx: row["Row_idx"], 
            content: row["Prompt"], 
        )
      end

      puts 'CSV data read successfully!'
    end

  end
end
  