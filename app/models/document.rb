class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :document_name
  belongs_to_active_hash :quantity
  belongs_to_active_hash :progress_status
end
