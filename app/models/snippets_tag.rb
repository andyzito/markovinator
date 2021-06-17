class SnippetsTag < ApplicationRecord
    belongs_to :snippet
    belongs_to :tag
    # belongs_to :snippet_tags
end
