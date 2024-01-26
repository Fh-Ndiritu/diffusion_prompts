require 'rails_helper'

RSpec.feature 'Dataset',  type: :feature do 

    describe 'user visits dataset' do 
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

    describe 'the splits are toggled ' do 
        let(:dataset) {create(:dataset, name: "Gusta Stables", language: "English")}
        train_split = test_split = nil

        before do 
            train_split = dataset.splits.create(name: "train")
            test_split = dataset.splits.create(name: "test")

            4.times{FactoryBot.create(:prompt, split: train_split)}
            4.times{FactoryBot.create(:prompt, split: test_split)}
            visit dataset_path(dataset)
        end

        it 'show prompts from all splits by default' do 
            expect(page).to have_text(train_split.prompts.first.content)
            expect(page).to have_text(test_split.prompts.first.content)
        end

        it 'toggles prompts when splits are toggled' do 
            find("a", text: "test data").click
            expect(page).to have_text(test_split.prompts.first.content)
            expect(page).not_to have_text(train_split.prompts.first.content)

            find("a", text: "training data").click
            expect(page).not_to have_text(test_split.prompts.first.content)
            expect(page).to have_text(train_split.prompts.first.content)

        end





    end

end