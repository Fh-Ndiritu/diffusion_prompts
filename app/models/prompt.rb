class Prompt < ApplicationRecord
  belongs_to :split
  validates :row_idx, presence: true,  numericality: {only_interger: true}
  validates :content, presence: true 

  extend Pagy::Searchkick
  searchkick

  after_save_commit :reindex_search



  private 

  def reindex_search
    reindex
  end
end
