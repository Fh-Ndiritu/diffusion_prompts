require 'rails_helper'

RSpec.feature 'Dataset',  type: :feature do 

    describe 'user visits dataset: ' do 
        let(:dataset){create(:dataset, name: "Gusta Stables", language: "English")}
        before do 
            visit dataset_path(dataset)
        end

        scenario 'shows a name/title' do 
            expect(page).to have_text("Gusta Stables")
        end

         scenario 'shows the language of prompts' do 
            expect(page).to have_text("English")
        end

    end

    describe 'When the splits are toggled: ' do 
        let(:dataset) {create(:dataset, name: "Gusta Stables", language: "English")}
        train_split = test_split = nil

        before do 
            train_split = dataset.splits.create(name: "train")
            test_split = dataset.splits.create(name: "test")

            4.times{create(:prompt, split: train_split)}
            4.times{create(:prompt, split: test_split)}
            visit dataset_path(dataset)
        end

        it 'show prompts from all splits by default' do 
            expect(page).to have_text(train_split.prompts.first.content)
            expect(page).to have_text(test_split.prompts.first.content)
        end

        it 'changes prompts when splits are clicked'  do 
            find("a", text: "Testing").click
            expect(page).to have_text(test_split.prompts.first.content)
            expect(page).not_to have_text(train_split.prompts.first.content)
        end

    end


    describe 'can have more than one dataset' do 
        it "shows multiple datasets", focus: do 
            set1 = create(:dataset, name: "Set One")
            set2  = create(:dataset, name: "Set Two")
            visit datasets_path

            expect(page).to have_text("Set One")
            expect(page).to have_text("Set Two")

            visit dataset_path(set1)
            expect(page).to have_text("Set One")
            expect(page).not_to have_text("Set Two")
        end
    end

end