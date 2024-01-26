class Split < ApplicationRecord
  belongs_to :dataset
  has_many :prompts, dependent: :destroy
  validates :name, presence: true


  scope :training, ->{where(name: "train")}
  scope :testing, ->{where(name: "test")}
  
end
