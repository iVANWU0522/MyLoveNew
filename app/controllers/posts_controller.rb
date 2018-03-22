class PostsController < ApplicationController

  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.json {render json: @post}
    end
  end

  def show
    @post = Post.find(params[:id])
    @photos = @post.photos

    respond_to do |format|
      format.html
      format.json {render json: @post}
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.json {render json: @post}
    end
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        if params[:images]
          params[:images].each { |image|
          @post.photos.create(image: image)
          }
        end

        format.html {redirect_to @post, notice: 'Post was successfully created'}
        format.json {render json: @post, status: :created, location: @post}
      else
        format.html {render action: "new"}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:photos, :caption)
  end
end
