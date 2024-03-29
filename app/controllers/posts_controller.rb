class PostsController < ApplicationController
    before_action :authenticate_user!

    def edit
        @post = Post.find(params[:id])
        render @post.status
    end

    def create
        @post = current_user.posts.create(post_params)
        redirect_to edit_post_path(@post)
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        if @post.published?
            redirect_to root_path
        else
        redirect_to edit_post_path(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:photo, :x_offset, :y_offset, :width, :height, :status, :filter_name, :description)
    end
end
