class ReviewsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@movie = Movie.find_by(id: params[:review][:movie_id])
		review = current_user.reviews.new(body: params[:review][:body], movie_id: params[:review][:movie_id])
		#debugger
		if review.save
		  redirect_to movie_path(@movie)
		else
		  render :template => "movies/show", :locals => { @movie => @movie}
		end
	end

	def destroy
	end
end
