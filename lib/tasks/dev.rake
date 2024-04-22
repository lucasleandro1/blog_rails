namespace :start_services do
  desc "Start Redis, Sidekiq, and Rails server"
  task :all do
    puts "Gems install..."
    system("bundle install")

    # puts "Destroy Database..."
    # system("rails db:drop")

    # puts "Create Database..."
    # system("rails db:create")

    # puts "Migrations..."
    # system("rails db:migrate")

    puts "Starting Redis server..."
    system("redis-server --daemonize yes")

    puts "Starting Rails server..."
    system("rails server -d")

    puts "Starting Sidekiq..."
    system("bundle exec sidekiq")
  end
end