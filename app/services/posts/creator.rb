module Posts
  class Creator
    def initialize(file)
      @file = file
    end

    def run!
      begin
        process!
      rescue => e
        raise StandardError.new e.message
      end
    end

    private

    def process!
      prepared_file[:posts].each do |post_params|
        user =  find_user(post_params[:user_email])
        next if user.blank?

        ActiveRecord::Base.transaction do
          begin
            post = post_constantized.new(text: post_params[:post_text], user_id: user.id)

            post.save!
          rescue => e
            raise StandardError.new e.message
          end
        end
      end
    end

    def post_constantized
      self.class.name.split("::").first.singularize.constantize
    end

    def prepared_file
      @prepared_file ||= parse_file
    end

    def find_user(email)
      User.find_by(email: email)
    end

    def parse_file
      json_data = JSON.parse(@file)
      json_data.with_indifferent_access
    end
  end
end
