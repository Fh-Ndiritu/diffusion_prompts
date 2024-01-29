class LoadHfPromptsJob < ApplicationJob
  queue_as :default

  def perform(dataset)
    dataset.splits.each do |split|
        p split
        puts "filling #{split.name} prompts"
        require 'csv'
        assets_directory = File.join( File.dirname(__FILE__), 'assets')
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
        else
          puts "File not found"
        end
    end
  end


end
