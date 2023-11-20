class RelationsController < ApplicationController
    before_action :should_already_login, only: [:create, :destroy]

    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        redirect_to '/one_friend/' + params[:followed_id]
    end

    def destroy
        logger.debug("##################")
        logger.debug(params[:id])
        logger.debug("##################")
        @user = Relation.find(params[:id]).followed
        current_user.unfollow(@user)
        redirect_to '/one_friend/' + @user.id.to_s
    end

    def followers 
        display_user = current_user
        @followers = display_user.followers
    end

    def followings
        display_user = current_user
        @followings = display_user.following
    end

end
