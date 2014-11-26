class ConsolesController < ApplicationController

  def index
    @consoles = Console.all
  end

  def show
    @console = Console.find(params[:id])
  end

  def edit
    @console = Console.find(params[:id])
  end

  def update
    @console = Console.find(params[:id])

    if @console.update_attributes(console_params)
      redirect_to console_path(@console)
    else
      render :edit
    end
  end

  # At this point there is no way to create a new console.
  # Don't push code that's not being used to master.
  def new
    @console = Console.new
  end

  def create
    @console = Console.new(console_params)

    if @console.save
      redirect_to console_path(@console)
    else
      render :new
    end
  end


  private

  def console_params
    params.require(:console).permit(:name)
  end
end
