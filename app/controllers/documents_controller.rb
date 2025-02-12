class DocumentsController < ApplicationController
  def index
    processed_status_id = ProgressStatus.find_by(status: '処理済')&.id
    @documents = Document.where.not(progress_status_id: processed_status_id).order(:due_date)
  end

  def show
    @document = Document.find(params[:id]) 
  end

  def new
    @document = Document.new(
      received_date: params[:received_date] || Date.today,
      start_date: params[:start_date],
      due_date: params[:due_date],
      customer_name: params[:customer_name]
    )
  end

  def create
    @document = Document.new(document_params)
    @document.user_id = current_user.id

    if @document.save
      if params[:commit] == "続けて登録する"
        flash[:notice] = '書類が登録されました。続けて登録してください。'
        redirect_to new_document_path(
          received_date: @document.received_date,
          start_date: @document.start_date,
          due_date: @document.due_date,
          customer_name: @document.customer_name 
        )
      else
        redirect_to root_path, notice: '書類が登録されました。'
      end
    else
      Rails.logger.info(@document.errors.full_messages)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
  
    if @document.update(document_params)
      redirect_to document_comments_path(@document), notice: '書類が変更されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @document = Document.find(params[:id])

    if @document.destroy
      redirect_to documents_path, notice: '書類が削除されました。'
    else
      Rails.logger.error(@document.errors.full_messages)
      redirect_to documents_path, alert: '書類の削除に失敗しました。'
    end
  end

  private

  def document_params
    params.require(:document).permit(:received_date, :start_date, :due_date, :customer_name, :document_name_id, :quantity_id)
  end
end