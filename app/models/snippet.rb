class Snippet < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  # serialize :tokens

  has_many :snippets_tags
  has_many :tags, through: :snippets_tags

  # before_save :tokenize

  def tokens
    text = self.body.sub(/<|>|:/, '')
    TokenMapping.find_each do |token_mapping|
      # puts '-----'
      # puts '[[[' + token_mapping.match.to_s + ']]]'
      # puts token_mapping.token_type
      # puts token_mapping.token_variant
      # puts token_mapping.replace
      # puts '----'
      text = text.gsub(token_mapping.match, ' ' + token_mapping.token + ' ')
    end
    text = text.gsub(/[^A-Za-z0-9\-\s\<\>\:]/, '')
    text = text.gsub(/\s+/, ' ')
    # text = text.gsub(/( <EOS:([a-z])> ){2,}/, ' <EOS> ')
    # text = text.gsub(/<EOS([a-z]+)>/, '<EOS:\1>')
    return text.split(' ')
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
