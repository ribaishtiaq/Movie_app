class MoviesController < ApplicationController
	before_action :authenticate_user! , only: [:new,:create,:edit,:destroy]
	before_action :check_if_movie_exists , only: [:show,:edit,:update]
	
	def index
		@movies = Movie.all.page(params[:page]).per(12)

	end

	def show
		@reviews = Review.where(movie_id: @movie.id)
		#@movie = Movie.find_by(id: params[:id])
		#@watch = Watch.find_by(movie_id: @movie.id)
		#@watchlist = Watchlist.find_by(movie_id: @movie.id)
	end

	def new
		@movie = Movie.new
		@movie.directors.build
		@movie.actors.build
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		#@movie = Movie.find_by(id: params[:id])
		@directors = @movie.directors
		@actors = @movie.actors
	end

	def update
		#@movie = Movie.find_by(id: params[:id])
		@directors = @movie.directors
		@actors = @movie.actors
		if @movie.update_attributes(movie_params)
			redirect_to root_path
		else
			render 'new'
		end
	end


	private

	def check_if_movie_exists #redirects to root if a movie id is not found in database.
		if Movie.exists?(id: params[:id])
			@movie = Movie.find_by(id: params[:id])		
		else
			@movie = Movie.new
			redirect_to root_path
		end
	end

	def movie_params
		params.require(:movie).permit(:name, :description,	:picture, :directors_attributes => [:id,:name,:movie_id],:actors_attributes => [:id,:name,:movie_id])
	end
end