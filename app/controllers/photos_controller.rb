class PhotosController < ApplicationController

  def index

    @post = Post.find(params[:post_id])

    @photos = @post.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end


  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @photo = @post.photos.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      respond_to do |format|
        format.html {
          render :json => [@photo.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json {
          render :json => [@photo.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def update

    @post = Post.find(params[:post_id])
    @photo = @post.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(photo_params)
        format.html { redirect_to post_path(@post), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @photo = Photo.find(params[:id])
    @post = Post.find(params[:post_id])

    @post.cover = @photo.id
    @post.save

    respond_to do |format|
      format.js
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:post_id, :image)
  end
end
