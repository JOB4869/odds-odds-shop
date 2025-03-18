class User < ApplicationRecord
  has_many :products
  has_many :orders, foreign_key: :buyer_id, class_name: "Order"
  has_many :sales, foreign_key: :seller_id, class_name: "Order"
end
