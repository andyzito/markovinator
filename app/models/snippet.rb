class Snippet < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  serialize :tokens
  
  has_many :snippets_tags
  has_many :tags, through: :snippets_tags

  before_save :tokenize

  def tokenize
    text = self.body.sub(/<|>/, '')
    token_map = {
        # ',': '<PAUSE>',
        # '-': '<PAUSE>',
        '!': ' <EOS> ',
        '.': ' <EOS> ',
        '?': ' <EOS> ',
    }
    token_map.each do |search, replace|
        text = text.gsub(/#{Regexp.escape(search)}+/, replace)
    end
    text = text.gsub(/[^A-Za-z0-9\-\s\<\>]/, '')
    text = text.gsub(/\s+/, ' ')
    text = text.gsub(/( <EOS> ){2,}/, ' <EOS> ')
    self.tokens = text.split(' ')
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
