class Role <  ActiveHash::Base
  self.data = [
    { id: 1, name: '管理者' },
    { id: 2, name: '担当者' }
  ]

  include ActiveHash::Associations
  has_many :users
end
