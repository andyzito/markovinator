class Tag < ApplicationRecord
    validates :name, presence: true

    has_many :snippets_tags
    has_many :snippets, through: :snippets_tags

    has_many :generators_tags
    has_many :generators, through: :generators_tags

    def title
      return self.name
    end

  end
