class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update_attributes(genre_params)
      redirect_to genre_path(@genre)
    else
      render :edit
    end
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to genre_path(@genre)
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
