class DocumentsController < ApplicationController
  def index
    processed_status_id = ProgressStatus.find_by(status: '処理済')&.id
    @documents = Document.where.not(progress_status_id: processed_status_id).order(:due_date)
  end
end
