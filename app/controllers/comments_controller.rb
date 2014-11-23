class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
    render template: "comments/index", locals:{comments: @comments}
  end

  def show
    @comment = Comment.find(params[:id])
    render template: "comments/show", locals:{comment: @comment}
  end

  def new
    if session[:user_id]
      @article = Article.find(params[:article_id])
      @comment = Comment.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.find(session[:user_id])
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.assign_attributes({article: @article, commenter: @user})

    if @comment.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    if session[:user_id]
      @comment = Comment.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if session[:user_id] == @comment.commenter.id
      @comment.assign_attributes(comment_params)
    else
      flash[:error] = "You don't have permission"
    end

    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :edit
    end
  end

  def destroy
    if session[:user_id] == @comment.commenter.id
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to(article_path(@comment.article))
    else
      redirect_to login_path
    end
  end

  def new_reply
    if session[:user_id]
      @parent = Comment.find(params[:comment_id])
      @reply = Comment.new
    else
      redirect_to login_path
    end
  end

  def reply
    @user = User.find(session[:user_id])
    @article = Article.find(params[:article_id])
    @parent = Comment.find(params[:comment_id])
    @reply = Comment.new(comment_params)
    @reply.assign_attributes({parent: @parent, article: @article, commenter: @user})

    if @reply.save
      redirect_to article_path(@article)
    else
      render template: "comments/new_reply"
    end
  end

  def vote
    if session[:user_id]
      @user = User.find(session[:user_id])
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:comment_id])
      @vote = Vote.new(voteable: @comment, voter: @user)
    else
      redirect_to login_path
    end

    if @vote.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end