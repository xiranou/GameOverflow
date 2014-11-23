class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def show
    @comment = Comment.find(params[:id])
    render template: "comments/show", locals:{comment: @comment}
  end

  def new
    @comment = Comment.new
  end

  def edit
    @article = Article.find(params[:article_id])
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
    redirect_to(article_comments_path(@comment.article))
  end

  def new_reply
    @parent = Comment.find(params[:comment_id])
    @reply = Comment.new
  end

  def reply
    @article = Article.find(params[:article_id])
    @parent = Comment.find(params[:comment_id])
    @reply = Comment.new(comment_params)
    @reply.assign_attributes({parent: @parent, article: @article})

    if @reply.save
      redirect_to article_path(@article)
    else
      render template: "comments/new_reply"
    end
  end

  def vote
    @comment = Comment.find(params[:comment_id])
    @vote = Vote.create(voteable: @comment)
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end