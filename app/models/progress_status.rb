class ProgressStatus < ActiveHash::Base
  self.data = [
    { id: 1, status: '未処理' },
    { id: 2, status: '処理済' },
    { id: 3, status: '不備' }
  ]
  include ActiveHash::Associations
  has_many :documents
end