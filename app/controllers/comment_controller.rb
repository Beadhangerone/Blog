class CommentController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment: params[:comment])
    redirect_to post_path(post)
  end

end
