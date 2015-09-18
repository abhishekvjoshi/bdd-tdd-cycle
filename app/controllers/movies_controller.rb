class MoviesController < ApplicationController
	helper_method :sort_column

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :sortby)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
	#@movies = Movie.all
	if params[:sortby] == "title"
		@movies = Movie.all.sort_by { |r| r.title }
	elsif params[:sortby] == "releasedate"
		@movies = Movie.all.sort_by { |r| r.release_date }
	else
		@movies = Movie.all
	end
	#@movies = Movie.order(:title, :release_date)
	#@movies = Movie.all.sort_by { |r| r.title }
    #@movies = Movie.order(sort_column)
  end
  
  def title
	#@movies = Movie.all
    @movies = Movie.all.sort_by { |r| r.title }
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  def sort_column
	Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
