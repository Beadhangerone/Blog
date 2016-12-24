class CommentController < ApplicationController
  def create
    comment = $post.comments.new
    comment.text = params[:comment][:text]
    comment.author_id = current_user.id
    if comment.save
      flash[:notice] = "Commented successfully."
      redirect_to post_path($post)
    else
    	redirect_to post_path($post)
    end
  end

end
