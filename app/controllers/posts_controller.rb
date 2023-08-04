class PostsController < ApplicationController
    def new
        @new_post = current_user.posts.build
    end

    def create
        create_post = current_user.posts.build(post_parameters)
        if create_post.save
            redirect_to root_url
        else
            redirect_to '/new_post'
        end
    end

    def destroy

    end

    private

        def post_parameters
            params.require(:post).permit(:discount, :price, :memo)
        end

end
