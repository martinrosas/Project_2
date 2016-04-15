class MoviesController < ApplicationController
  def index
  @movies = Movie.all

end

  def show
  @movie = Movie.find(params[:id])
end

  def new
  @movie = Movie.new
  end

  def create
  @movie = Movie.new(params.require(:movie).permit(:title, :description, :runtime, :genre))

  if @movie.save
    redirect_to movies_path
  else
    render :new
  end
end

  def edit
  @movie = Movie.find(params[:id])
  end

  def update
  @movie = Movie.find(params[:id])

  if @movie.update_attributes(params.require(:movie).permit(:title, :description, :runtime, :genre))
    redirect_to movies_path
  else
    render :edit
  end
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

end
