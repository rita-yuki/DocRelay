class CommentsController < ApplicationController
  def create
    @document = Document.find(params[:document_id])
    @comment = @document.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to document_path(@document), notice: '投稿されました。'
    else
      flash[:alert] = '投稿に失敗しました。'
      redirect_to document_path(@document)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
end
