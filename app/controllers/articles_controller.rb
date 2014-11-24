class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render template: "articles/index", locals:{articles: @articles}
  end

  def show
    @article = Article.find(params[:id])
    render template: "articles/show", locals:{article: @article}
  end

  def edit
    if session[:user_id]
      @article = Article.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def update
    @article = Article.find(params[:id])
    if session[:user_id] == @article.author.id
      @article.assign_attributes(article_params)
    else
      flash[:error] = "You don't have permission"
    end

    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def new
    if session[:user_id]
      @article = Article.new
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.find(session[:user_id])
    @article = Article.new(article_params)
    @article.assign_attributes({author: @user})
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    if session[:user_id]
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to(articles_path)
    else
      redirect_to login_path
    end
  end

  def vote
    if session[:user_id]
      @user = User.find(session[:user_id])
      @article = Article.find(params[:article_id])
      @vote = Vote.new(voteable: @article, voter: @user)
    else
      redirect_to login_path
    end

    if @vote.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  def content_preview

  end

  def recent

  end

  def popular

  end

  private

  def article_params
    params.require(:article).permit(:title,:content)
  end
end