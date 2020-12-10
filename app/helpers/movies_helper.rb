module MoviesHelper	
	#checks if a user have watched a movie or not,based on this we render a button 'Watched' or 'Unwatch', 
	#which sends a ajax request to add a movie in watch-list or to remove a movie from watch list
	def watched?(movie) 
	  !current_user.watch.find_by(movie_id: movie).nil?
	end

	def watchlist?(movie)
	  !current_user.watchlist.find_by(movie_id: movie).nil?
	end
end
