class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders, foreign_key: :buyer_id, class_name: "Order"
  has_many :sales, foreign_key: :seller_id, class_name: "Order"

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :password, format: {
    with: /\A(?=.*[a-zA-Z])(?=.*\d)(?=.*[!"#$%&'()*+,-.\/:;<=>?@[\\]^_`{|}~])[A-Za-z\d!"#$%&'()*+,-.\/:;<=>?@[\\]^_`{|}~]{8,16}\z/,
    message: "ต้องมีความยาว 8-16 ตัวอักษร และประกอบด้วยตัวอักษร, ตัวเลข, และสัญลักษณ์ที่อนุญาต"
  }
end
