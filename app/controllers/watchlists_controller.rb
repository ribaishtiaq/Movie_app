class WatchlistsController < ApplicationController
  
	def create
	  	@movie = Movie.find(params[:watchlist_id])
	  	current_user.watchlist.create(movie_id: @movie.id)
	  	respond_to do |format|
	  		format.html {redirect_to @movie}
	  		format.js
	  	end
	end

	def destroy
	  	@movie = Watchlist.find(params[:id]).movie
	  	current_user.watchlist.find_by(movie_id: @movie.id).destroy
	  	respond_to do |format|
	  		format.html {redirect_to @movie}
	  		format.js
		end
	end
end