class DocumentName < ActiveHash::Base
  include ActiveHash::Associations

  has_many :documents

  self.data = [
    { id: 1, name: '契約書' },
    { id: 2, name: '同意書' },
    { id: 3, name: '申込書' },
    { id: 4, name: '本人確認資料' }
  ]
end
