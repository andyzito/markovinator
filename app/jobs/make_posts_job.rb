class MakePostsJob < ApplicationJob
  queue_as :default

  def perform(*tags)
    # Do something later
  end
end
