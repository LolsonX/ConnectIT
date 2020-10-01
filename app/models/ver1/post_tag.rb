class Ver1::PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end
