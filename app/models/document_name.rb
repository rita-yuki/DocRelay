class DocumentName < ActiveHash::Base
  self.data = [
    { id: 1, name: '契約書' },
    { id: 2, name: '同意書' },
    { id: 3, name: '申込書' },
    { id: 4, name: '本人確認資料' },
  ]

  class Quantity < ActiveHash::Base
    self.data = [
      { id: 1, value: '1件' },
      { id: 2, value: '2件' },
      { id: 3, value: '3件' },
      { id: 4, value: '4件' },
      { id: 5, value: '5件' },
    ]
  end
  
  class ProgressStatus < ActiveHash::Base
    self.data = [
      { id: 1, status: '未処理' },
      { id: 2, status: '処理済' },
      { id: 3, status: '不備' }
    ]

  include ActiveHash::Associations
  has_many :documents
end