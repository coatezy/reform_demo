class PostsController < ApplicationController
  before_action :set_post
  before_action :set_form

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    if @form.validate(params[:post])
      @form.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @form.validate(params[:post])
      @form.save
      redirect_to @post, notice: 'Post was successfully updates.'
    else
      render :new
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id]) || Post.new
    end

    def set_form
      @form = PostForm.new(@post)
    end
end
