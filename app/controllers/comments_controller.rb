class CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render template: "comments/index", locals:{comments: @comments}
  end

  def show
    @comment = Comment.find(params[:id])
    render template: "comments/show", locals:{comment: @comment}
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(comments_path)
  end

  def new_reply
    @parent = Comment.find(params[:comment_id])
    @reply = Comment.new(parent: @parent)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end