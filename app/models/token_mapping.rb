class TokenMapping < ApplicationRecord
  validates :match, presence: true
  validates :token_type, presence: true
  validates :token_variant, presence: true
  validates :replace, presence: true

  serialize :match

  def token
    return '<' + self.token_type + ':' + self.token_variant + '>'
  end
end
