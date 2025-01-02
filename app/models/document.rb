class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :document_name
  belongs_to_active_hash :quantity
  belongs_to_active_hash :progress_status
  belongs_to :user
  
  validates :received_date, :start_date, :due_date, :customer_name, presence: true
end
