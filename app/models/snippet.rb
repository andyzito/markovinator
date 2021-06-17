class Snippet < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    # validates :tags
    
    has_many :snippets_tags
    has_many :tags, through: :snippets_tags
end
