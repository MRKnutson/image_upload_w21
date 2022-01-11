class Api::UsersController < ApplicationController

  before_action :authenticate_user!, only: [:image_demo1]

  def image_demo1
    file = params[:fileYo]
    if file
      begin
        # ext = File.extname(file.tempfile)
        puts "trying to save to cloudinary"
        puts"----------------------"
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


  def image_demo2
    file = params[:files]
    user = User.find(params[:id])
    if file
      begin
        # ext = File.extname(file.tempfile)
        puts "trying to save to cloudinary"
        puts"----------------------"
        cloud_image = Cloudinary::Uploader.upload(file, public_id: file.original_filename, secure: true, resource_type: :auto)
        puts cloud_image
      rescue => e
        render json: { errors: e }, status: 422
        return
      end
    end
    
    #save to database
    image = user.images.new(url: cloud_image['secure_url'])
    if(image.save)
      render json: image
    else
      render json: {errors: image.errors }, status: 422
    end

  end
end
