class CommentController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(text: params[:comment], author_id: current_user.id)
    redirect_to post_path(post)
  end

end
