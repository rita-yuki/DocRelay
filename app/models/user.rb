class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Emailの検証を無効化
  def email_required?
    false
  end

  def email_changed?
    false
  end

  validates :employee_number, presence: true, uniqueness: true
end
