class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @recent_articles = Article.recent
    @popular_articles = Article.popular
    render template: "articles/index", locals:{articles: @articles, recent_articles: @recent_articles, popular_articles: @popular_articles}
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
    @game = Game.find_or_create_by(title: params[:article][:game_topics])
    @genre = Genre.find_or_create_by(name: params[:article][:genre_topics])
    @console = Console.find_or_create_by(name: params[:article][:console_topics])
    topics = [Topic.find_or_create_by(discussable: @game), Topic.find_or_create_by(discussable: @genre), Topic.find_or_create_by(discussable: @console)]
    topics.each do |topic|
      @article.topics << topic
    end
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
      count = @article.vote_count
      count +=1
      @article.update_attributes(vote_count: count)
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title,:content)
  end
end