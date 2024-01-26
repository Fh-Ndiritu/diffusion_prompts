class Dataset < ApplicationRecord
    validates :name, presence: true
    validates :data_type, presence: true
    validates :language, presence: true
    
end
