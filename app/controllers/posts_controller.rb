class PostsController < ApplicationController
  # before action
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owned_post, only: [:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order('created_at DESC').page params[:page]

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.js
    # end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @photos = @post.photos

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts
  # POST /posts.json
  def create

    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save

        if params[:images]
          # The magic is here ;)
          params[:images].each.with_index { |image, index|
            @post.photos.create(image: image, position: index)
          }
        end

        format.html { redirect_to posts_path, notice: 'Your post has been created!' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new", notice: "Your new post couldn't be created! Please check the form." }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update_attributes(post_params)
        if params[:images]
          # The magic is here ;)
          params[:images].each.with_index { |image, index|
            @post.photos.create(image: image, position: index)
          }
        end
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: "Update failed.  Please check the form." }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That post doesn't belong to you"
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:photos, :caption)
  end
end
