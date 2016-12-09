class CommentController < ApplicationController
  def create
    comment = $post.comments.create(text: params[:comment][:text], author_id: current_user.id)
    if comment.valid?
      flash[:notice] = "Commented successfully."
      redirect_to post_path($post)
    else
      redirect_to post_path($post)
    end
  end

end
