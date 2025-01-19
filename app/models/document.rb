class Document < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :document_name
  belongs_to_active_hash :quantity
  belongs_to_active_hash :progress_status
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :received_date, :start_date, :due_date, :customer_name, presence: true
  validate :start_date_and_due_date_validations

  private

  def start_date_and_due_date_validations
    if start_date.present? && start_date < received_date
      errors.add(:start_date, '（手続き開始可能日）を確認してください。')
    end

    if due_date.present? && due_date < start_date
      errors.add(:due_date, '（手続き期日）を確認してください。')
    end

    if due_date.present? && due_date < received_date
      errors.add(:due_date, '（手続き期日）を確認してください。')
    end
  end
end
