class UploadFileController < ApplicationController
  def new
  end

  def create
    begin
      if params.keys.include?("file")
        file = params[:file].tempfile.read

        # CreatePosts.perform_async(file)
        ::Posts::Creator.new(file).run!
        redirect_to root_path, alert: "Processing in background!"
      else
        raise StandardError.new('File missing!')
      end
    rescue StandardError => e
      flash[:alert] = e.message
      render :new
    end
  end
end
