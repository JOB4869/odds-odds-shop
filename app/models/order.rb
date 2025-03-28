class Order < ApplicationRecord
  belongs_to :product
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_one :payment

  enum status: { pending: "pending", completed: "completed", cancelled: "cancelled" }
end
