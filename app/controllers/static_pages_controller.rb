class StaticPagesController < ApplicationController
    before_action :should_already_login, only: [:home, :friends, :one_friend]

    def home 
        posts = current_user.posts
        @discount_sum = posts.sum(:discount)
        @posts = posts.paginate(page: params[:page], per_page: 10)
    end

    def find_friend
        @users = User.paginate(page: params[:page], per_page: 15)
    end

    def friends
        @friends = current_user.following
    end

    def one_friend
        @display_user = User.find(params[:display_user_id])
        @posts = @display_user.posts.paginate(page: params[:page], per_page: 15)
    end

end
