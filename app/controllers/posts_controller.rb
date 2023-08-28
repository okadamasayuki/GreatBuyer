class PostsController < ApplicationController
    before_action :should_already_login, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @new_post = current_user.posts.build
    end

    def create
        create_post = current_user.posts.build(post_parameters)
        create_post.image.attach(params[:post][:image])
        if create_post.save
            redirect_to root_url
        else
            redirect_to '/new_post'
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_parameters)
            redirect_to root_path
        else
            redirect_to edit_post_path(@post)
        end
    end
        

    def destroy
        @delete_post = Post.find(params[:id])
        @delete_post.destroy
        redirect_to request.referer
    end

    def search
        search_word = params[:word]
        @posts = Post.where("memo LIKE ?", "%#{search_word}%")
    end

    private

        def post_parameters
            params.require(:post).permit(:discount, :price, :memo, :image)
        end

end
