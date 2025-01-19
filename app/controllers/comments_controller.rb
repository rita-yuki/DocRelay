class CommentsController < ApplicationController
  before_action :set_document, only: [:index, :create]

  def index
    @comments = @document.comments.includes(:user).order(created_at: :desc)
  end

  def create
    @comment = @document.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to document_comments_path(@document), notice: '投稿されました。'
    else
      flash[:alert] = '投稿に失敗しました。'
      redirect_to document_comments_path(@document)
    end
  end

  private

  def set_document
    @document = Document.find(params[:document_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = '対象のドキュメントが見つかりませんでした。'
    redirect_to documents_path
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
