class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(article_params)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to(articles_path)
  end

  def new_comment
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    render template: "comments/new"
  end

  def create_comment
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.assign_attributes({article: @article})

    if @comment.save
      redirect_to article_path(@article)
    else
      render template: "comments/new"
    end
  end

  def vote
    @user = User.find(session[:user_id])
    @article = Article.find(params[:article_id])
    @vote = Vote.create(voteable: @article, voter: @user)
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title,:content)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end