class Prompt < ApplicationRecord
  belongs_to :split
  validates :row_idx, presence: true,  numericality: {only_interger: true}
  validates :content, presence: true 

  searchkick
end
