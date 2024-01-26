class Split < ApplicationRecord
  belongs_to :dataset
  validates :name, presence: true
end
