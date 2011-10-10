class PostsController < ApplicationController
  # GET - displays all posts
  def index
    @posts = Post.find :all, :order => 'created_at ASC'
  end

  # GET - shows one post (based on the supplied id)
  def show
    @post = Post.find(params[:id])
  end

  # GET - displays a form which can be used to create a post
  def new
    @post = Post.new
  end


  # POST - creates new post
  def create
    @post = Post.new(params[:post])
    @post.save!
    redirect_to post_path(@post)
    rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  # GET - displays a form allowing us to edit an existing post
  def edit
    @post = Post.find(params[:id])
  end

  
  # PUT - updates an existing post
  def update
  @post = Post.find(params[:id])
  @post.attributes = params[:post]
  @post.save!
  redirect_to post_path(@post)
  rescue ActiveRecord::RecordInvalid
  render :action => 'edit'
  end


  # DELETE - deletes a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
