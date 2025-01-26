class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  belongs_to :document_name, class_name: 'DocumentName'
  belongs_to :quantity
  has_many :comments, dependent: :destroy

  validates :received_date, :start_date, :due_date, :customer_name, :user_id, presence: true

  validate :start_date_and_due_date_validations

  private

  def start_date_and_due_date_validations
    if start_date.present? && due_date.present? && start_date > due_date
      errors.add(:start_date, '手続き日を確認してください。')
    end
  end
end
