class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]
  before_action :only_my_comments, only: [:edit, :update, :destroy]

  def index
    if current_user
      @comments = current_user.comments
    else
     @comments = Comment.all
    end
  end

  def show
  @comment = Comment.find(params[:id])
  end

  def new
  @comment = Comment.new
  end

  def create
  @comment = Comment.new(params.require(:comment).permit(:content, :user_id, :movie_id))
  @comment.user = current_user
  if @comment.save
    redirect_to movie_path(@comment.movie)
  else
    render :new
  end
  end

  def edit
  @comment = Comment.find(params[:id])
  end

  def update
  @comment = Comment.find(params[:id])

  if @comment.update_attributes(params.require(:comment).permit(:content, :user_id, :movie_id))
    redirect_to comments_path
  else
    render :edit
  end
  end

  def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to comments_path
  # Comment.find(params[:id]).destroy
  # flash[:success] = "Comment deleted"
  # redirect_to comments_path
  end

  private

   def set_comment
      @comment = Comment.find(params[:id])

    end

    def comment_params
      params.require(:comment).permit(:content)
    end

   def only_my_comments
      redirect_to root_path, notice: "you can't edit someone elses comments" if (current_user != @comment.user)
    end




end
