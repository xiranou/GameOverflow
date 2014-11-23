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
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.assign_attributes({article: @article})

    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to article_path(@comment.article)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(article_path(@comment.article))
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
    @user = User.find(session[:user_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:comment_id])
    @vote = Vote.create(voteable: @comment, voter: @user)
    redirect_to article_comments_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end