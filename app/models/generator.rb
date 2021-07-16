class Generator < ApplicationRecord
  validates :tags, presence: true
  # validates :config, presence: true

  has_many :generators_tags
  has_many :tags, through: :generators_tags

  has_one :generator_config

  serialize :model
  before_save :create_model

  def title
    return self.name
  end

  def create_model
    all_tokens = self.tags.collect do |tag|
      tag.snippets.collect do |snippet|
        snippet.tokens
      end
    end

    model = { }
    all_tokens.each do |tag_tokens|
      tag_tokens.each do |tokens|
        tokens.each_with_index do |token, i|

          next_token = tokens[i + 1]
          if (next_token.nil?)
            next
          end
          model[token] = model.fetch(token, {})
          model[token][next_token] = model[token].fetch(next_token, 0) + 1
        end
      end
    end
    self.model = model
  end

  def preview
    text = ""
    model = self.model

    current = model['<EOS:period>'].max_by { |_, weight| rand ** (1.0 / weight) }.first
    150.times do |i|
      if /<[A-Z]+:[a-z]+>/.match(current)
        token_mapping = TokenMapping.find_by(token_type: current[/<([A-Z]+):[a-z]+>/,1], token_variant: current[/<[A-Z]+:([a-z]+)>/,1])
        text = text + token_mapping.replace
      elsif
        text = text + ' ' + current
      end
      nextprobs = model[current]
      current = nextprobs.max_by { |_, weight| rand ** (1.0 / weight) }.first
    end

    if text[-1] != '.'
      text = text + '.'
    end
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

  def config_renderable
    return self.config.to_h
  end

  def config_renderable=(config_renderable)

  end
end
