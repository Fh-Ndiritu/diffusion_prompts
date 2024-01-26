require 'rails_helper'

RSpec.describe Prompt, type: :model do
  describe 'has associations:' do 
    it 'belongs to a split' do 
      assoc = described_class.reflect_on_association(:split)
      expect(assoc.macro).to eq(:belongs_to)
    end
  end

  describe 'has some required attributes:' do 
    it ' has a row_idx as integer' do 
      prompt = build(:prompt, row_idx: nil)
      expect(prompt).not_to be_valid
      expect(prompt.errors[:row_idx]).to include("can't be blank")

      prompt = build(:prompt, row_idx: "ten")
      prompt.save
      expect(prompt.errors[:row_idx]).to include("is not a number")
      
    end

    it ' has content' do 
      prompt = build(:prompt, content: nil)
      expect(prompt).not_to be_valid
      expect(prompt.errors[:content]).to include("can't be blank")
    end


  end
end
