module SnippetsHelper
    def tokenize (text)
        text = text.sub(/<|>/, '')
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
        return text.split(' ')
    end

    def create_model tokens
        @model = { }
        tokens.each_with_index do |token, i|
            next_token = tokens[i + 1]
            @model[token] = @model.fetch(token, {})
            @model[token][next_token] = @model[token].fetch(next_token, 0) + 1
        end
        return @model
    end
end
