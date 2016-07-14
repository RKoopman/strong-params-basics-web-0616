class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
    # params[:post].permit!
    # byebug
    # params = {post: {free: 'true'}}
    # post = Post.new({free: 'true'})
    # byebug
  	@post = Post.new(post_params(:title, :description))
  	@post.save
  	redirect_to post_path(@post)
	end
 
	def update
  	@post = Post.find(params[:id])
  	@post.update(post_params(:title))
  	redirect_to post_path(@post)
	end

  def edit
    @post = Post.find(params[:id])
  end
 
private

	def post_params(*args)
  	params.require(:post).permit(*args)
  end

	
end


# summary
  # To have strong params set up a private method, which takes in any number of arguments, which refer to the 
  # fields int the form.  
  # 