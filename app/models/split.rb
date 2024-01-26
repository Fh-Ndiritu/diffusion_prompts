class Split < ApplicationRecord
  belongs_to :dataset
  has_many :prompts
  validates :name, presence: true
end
