class DeleteOldPostsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Find and delete posts older than 24 hours
    Post.where("created_at < ?", 24.hours.ago).destroy_all
  end
end
