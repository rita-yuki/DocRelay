class Quantity < ApplicationRecord
  class Quantity < ActiveHash::Base
    self.data = [
      { id: 1, value: '1件' },
      { id: 2, value: '2件' },
      { id: 3, value: '3件' },
      { id: 4, value: '4件' },
      { id: 5, value: '5件' }
    ]
    include ActiveHash::Associations
    has_many :documents
  end
end
