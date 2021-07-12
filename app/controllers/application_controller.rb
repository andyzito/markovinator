# require 'github/markup'

class ApplicationController < ActionController::Base
  def home
    # @readme = GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, File.read('README.md'))
  end
end
