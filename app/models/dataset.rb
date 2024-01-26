class Dataset < ApplicationRecord
    validates :name, presence: true
    validates :data_type, presence: true
    validates :language, presence: true

    has_many :splits, dependent: :destroy
    has_many :prompts, through: :splits
    
end
