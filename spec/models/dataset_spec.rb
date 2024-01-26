require 'rails_helper'

RSpec.describe Dataset, type: :model do
  describe 'it has associations' do 
      it 'has many splits' do 
      association = described_class.reflect_on_association(:splits)
      expect(association.macro).to eq(:has_many)
    end

  end

  describe 'it has required attributes' do 
    it 'has a name' do 
      dataset = build(:dataset, name: nil)
      expect(dataset).not_to be_valid
      expect(dataset.errors[:name]).to include("can't be blank")
    end

    it 'has a type' do 
      dataset = build(:dataset, data_type: nil)
      expect(dataset).not_to be_valid
      expect(dataset.errors[:data_type]).to include("can't be blank")
    end

    it 'has a language' do 
      dataset = build(:dataset, language: nil)
      expect(dataset).not_to be_valid
      expect(dataset.errors[:language]).to include("can't be blank")
    end
  end


end
