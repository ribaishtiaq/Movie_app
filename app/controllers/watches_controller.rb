class WatchesController < ApplicationController
	
	def create
	  	@movie = Movie.find(params[:watch_id])
	  	current_user.watch.create(movie_id: @movie.id)
	  	respond_to do |format|
	  		format.html {redirect_to @movie}
	  		format.js
	  	end
	end

	def destroy
		@movie = Watch.find(params[:id]).movie
		current_user.watch.find_by(movie_id: @movie.id).destroy
	  	respond_to do |format|
	  		format.html {redirect_to @movie}
	  		format.js
		end
	end
end