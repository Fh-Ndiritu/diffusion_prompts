class Prompt < ApplicationRecord
  belongs_to :split
  validates :row_idx, presence: true,  numericality: {only_interger: true}
  validates :content, presence: true 

  searchkick

  after_save_commit :reindex_search



  private 

  def reindex_search
    reindex
  end
end
