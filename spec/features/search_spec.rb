require 'rails_helper'


RSpec.feature "Search", type: :feature do 
    let(:dataset) {create(:dataset, name: "Drogon", language: "English")}
    train_split = test_split = nil

    before do 
        train_split = dataset.splits.create(name: "train")
        test_split = dataset.splits.create(name: "test")

        create(:prompt, split: train_split, content: "Some info in a training set")
        create(:prompt, split: test_split, content: "More data in a testing set")
        Prompt.reindex
    end
        
    describe "user searches prompts within dataset" do 
        before do 
            visit dataset_path(dataset)
        end

        scenario 'returns all matches with no split selected' do 
            fill_in 'query', with: "set"
            click_button 'Search'
            expect(page).to have_content("More data in a testing set")
            expect(page).to have_content("Some info in a training set")
        end

        scenario 'returns only scoped matches if split is selected', js: true  do 
            fill_in 'query', with: 'set'
            select 'train', from: 'split'
            click_button 'Search'
            expect(page).to have_content("Some info in a training set")
            expect(page).not_to have_content("More data in a testing set")
        end
    end

    describe 'scopes search to navigated split' do 
        scenario 'user searches within training split', js: true do 
            visit split_path(train_split)
            fill_in 'query', with: 'set'
            click_button 'Search'
            expect(page).to have_content("Some info in a training set")
            expect(page).not_to have_content("More data in a testing set")
        end

         scenario 'user searches within testing split', js: true do 
            visit split_path(test_split)
            fill_in 'query', with: 'set'
            click_button 'Search'
            expect(page).not_to have_content("Some info in a training set")
            expect(page).to have_content("More data in a testing set")
        end   
    end

    describe 'searches across all datasets' do 
        
        scenario 'returns prompts from both datasets' do 
            dataset2 = create(:dataset, name: "Caraxes", language: "English")
            train2 = dataset2.splits.create(name: "train")
            test2 = dataset2.splits.create(name: "test")

            create(:prompt, split: train2, content: "This is training set2")
            create(:prompt, split: test2, content: "This is testing set2")
            Prompt.reindex

            visit(prompts_path)
            fill_in 'query', with: 'training'
             click_button 'Search'

            expect(page).to have_content("Some info in a training set")
            expect(page).to have_content("This is training set2")
        end
    end
end