class CreatePosts
  include Sidekiq::Worker

  def perform(file)
    ::Posts::Creator.new(file).run!
  end
end