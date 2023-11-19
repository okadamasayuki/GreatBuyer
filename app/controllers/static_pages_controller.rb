class StaticPagesController < ApplicationController
    before_action :should_already_login, only: [:home, :friends, :one_friend]

    def home 
        @all_posts = current_user.posts.order(created_at: :desc)
        @discount_sum = @all_posts.sum(:discount)
        @posts_in_this_page = @all_posts.paginate(page: params[:page], per_page: 10)
        this_month_post = @all_posts.where(created_at: Date.today.beginning_of_month..Date.today.end_of_month)
        prev_month_post = @all_posts.where(created_at: 1.months.ago.all_month)
        prev_2_month_post = @all_posts.where(created_at: 2.months.ago.all_month)
        prev_3_month_post = @all_posts.where(created_at: 3.months.ago.all_month)
        prev_4_month_post = @all_posts.where(created_at: 4.months.ago.all_month)
        @data = [
                    [Date.today.month.to_s+"月", this_month_post.sum(:discount)],
                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(2).month.to_s+"月", prev_2_month_post.sum(:discount)],                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(3).month.to_s+"月", prev_3_month_post.sum(:discount)],                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(4).month.to_s+"月", prev_4_month_post.sum(:discount)],
                ]
        pie_chart_data = @all_posts.group(:shop).sum(:discount)
        @pie_chart_data = pie_chart_data.sort_by {|key, val| -val }.to_h
        @pie_chart_data.delete(nil)
    end

    def find_friend
        @users = User.paginate(page: params[:page], per_page: 35)
    end

    def friends
        @friends = current_user.following
    end

    def one_friend
        @display_user = User.find(params[:display_user_id])
        @all_posts = @display_user.posts.order(created_at: :desc)
        @discount_sum = @all_posts.sum(:discount)
        @posts_in_this_page = @all_posts.paginate(page: params[:page], per_page: 10)
        this_month_post = @all_posts.where(created_at: Date.today.beginning_of_month..Date.today.end_of_month)
        prev_month_post = @all_posts.where(created_at: 1.months.ago.all_month)
        prev_2_month_post = @all_posts.where(created_at: 2.months.ago.all_month)
        prev_3_month_post = @all_posts.where(created_at: 3.months.ago.all_month)
        prev_4_month_post = @all_posts.where(created_at: 4.months.ago.all_month)
        @data = [
                    [Date.today.month.to_s+"月", this_month_post.sum(:discount)],
                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(2).month.to_s+"月", prev_2_month_post.sum(:discount)],                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(3).month.to_s+"月", prev_3_month_post.sum(:discount)],                    [Date.today.months_ago(1).month.to_s+"月", prev_month_post.sum(:discount)],
                    [Date.today.months_ago(4).month.to_s+"月", prev_4_month_post.sum(:discount)],
                ]
        pie_chart_data = @all_posts.group(:shop).sum(:discount)
        @pie_chart_data = pie_chart_data.sort_by {|key, val| -val }.to_h
        @pie_chart_data.delete(nil)
    end

end
