class RelationshipsController < ApplicationController
	def create
		@user = User.find(params[:relationship][:follow_id])
		current_user.follow!(@user)
		redirect_to request.referer
	end

	def destroy
		@user = Relationship.find(params[:id]).following
		current_user.unfollow!(@user)
		redirect_to request.referer
	end
end
