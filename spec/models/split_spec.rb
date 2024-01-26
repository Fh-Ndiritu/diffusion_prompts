require 'rails_helper'

RSpec.describe Split, type: :model do
  describe 'it has associations' do 
    it 'belongs to a dataset' do 
      association = described_class.reflect_on_association(:dataset)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'it has many prompts' do 
      association = described_class.reflect_on_association(:prompts)
      expect(association.macro).to eq(:has_many)
    end
  end


  it 'has required attributes' do 
    split = build(:split, name: nil)
    expect(split).not_to be_valid
    expect(split.errors[:name]).to include("can't be blank")
  end
end
