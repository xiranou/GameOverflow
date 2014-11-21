class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def update
      @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end