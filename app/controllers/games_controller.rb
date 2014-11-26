class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update_attributes(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  # Again, at this point there's no way to create a new game.
  # These actions aren't currently needed.
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end


  private

  def game_params
    params.require(:game).permit(:title)
  end


end
