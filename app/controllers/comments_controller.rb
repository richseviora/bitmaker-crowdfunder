class CommentsController < ApplicationController
  def create

    if params[:project_id]
      commentable = Project.find(params[:project_id])
    elsif params[:user_id]
      commentable = User.find(params[:user_id])
    else
      raise 'Invalid Commentable'
    end
    @comment = commentable.comments.build(comment_params)
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.js
      format.html {redirect_to(polymorphic_path(commentable))}
    end
  end

  def comment_params
    params.permit(:text)
  end
end
