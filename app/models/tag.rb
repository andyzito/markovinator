class Tag < ApplicationRecord
    validates :name, presence: true

    has_many :snippets_tags
    has_many :snippets, through: :snippets_tags
end
