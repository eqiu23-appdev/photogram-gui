class CommentsController < ApplicationController

  def create
    a_new_comment = Comment.new
    a_new_comment.photo_id = params.fetch("input_photo_id")
    a_new_comment.author_id = params.fetch("input_author_id")
    a_new_comment.body = params.fetch("input_body")
    a_new_comment.save

    redirect_to("/photos/" + a_new_comment.photo_id.to_s)
  end

end
