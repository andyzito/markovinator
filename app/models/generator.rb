class Generator < ApplicationRecord
    has_many :generators_tags
    has_many :tags, through: :generators_tags  

    serialize :model
    before_save :create_model

    def create_model
    end

    def tag_list
      self.tags.collect do |tag|
        tag.name
      end.join(", ")
    end

    def tag_list=(tags_string)
      names = tags_string.split(',').collect{|s| s.strip.downcase}.uniq
      tags = names.collect do |name|
        Tag.find_or_create_by(name: name)
      end
      self.tags = tags
    end
end
