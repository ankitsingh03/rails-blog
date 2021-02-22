class CommentController < ApplicationController
    # def show
    #     @comment = Comment.where(post_id:id)
    # end

    def create
        @comment = Comment.new(commenter: params[:commenter], body: params[:body], user_id: params[:user_id], post_id:params[:post_id])

        if @comment.save
            redirect_to blog_path(params[:post_id])
        end
    end
end
