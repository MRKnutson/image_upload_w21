class Api::UsersController < ApplicationController

  before_action :authenticate_user!

  def image_demo1
    file = params[:fileYo]
    if file
      begin
        # ext = File.extname(file.tempfile)
        cloud_image = Cloudinary::Uploader.upload(file, public_id: file.original_filename, secure: true, resource_type: :auto)
        puts cloud_image
      rescue => e
        puts e
        render json: { errors: e }, status: 422
        return
      end
    end
    if cloud_image && cloud_image['secure_url']
      current_user.image = cloud_image['secure_url']
    end
    if params[:nickname]
      current_user.nickname = params[:nickname]
    end
    if current_user.save
      render json: current_user
    else
      render json: {errors: e }, status: 422
    end
  end

end
