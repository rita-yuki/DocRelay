class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :employee_number, presence: true, uniqueness: true

 before_update :prevent_employee_number_change
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
end
