class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :employee_number, presence: true, uniqueness: true
 :role_id, presence: true, inclusion: { in: Role.pluck(:id), message: "は選択肢の中から選んでください。" }
 before_update :prevent_employee_number_change
 before_validation :set_default_role, on: :create

  # Emailの検証を無効化
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  private

  # 社員番号を変更できないようにする
  def prevent_employee_number_change
    if employee_number_changed?
      errors.add(:employee_number, "は変更できません。")
      throw(:abort)
    end
  end

  def set_default_role
    self.role_id ||= Role.find_by(name: '担当者')&.id
  end
end
