class Split < ApplicationRecord
  belongs_to :dataset
  has_many :prompts, dependent: :destroy
  validates :name, presence: true
end
