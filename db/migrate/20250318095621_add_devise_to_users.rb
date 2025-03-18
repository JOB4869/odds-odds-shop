class AddDeviseToUsers < ActiveRecord::Migration[6.0]
  def change
    # ลบการเพิ่มคอลัมน์ที่มีอยู่แล้ว
    # add_column :users, :reset_password_token, :string
    # add_column :users, :reset_password_sent_at, :datetime
    # add_column :users, :remember_created_at, :datetime

    # เพิ่มเฉพาะคอลัมน์ที่จำเป็นจาก Devise (ถ้ายังไม่ถูกเพิ่มไว้)
    unless column_exists?(:users, :reset_password_token)
      add_column :users, :reset_password_token, :string
    end

    unless column_exists?(:users, :reset_password_sent_at)
      add_column :users, :reset_password_sent_at, :datetime
    end

    unless column_exists?(:users, :remember_created_at)
      add_column :users, :remember_created_at, :datetime
    end

    # เพิ่ม index เฉพาะเมื่อไม่มีอยู่แล้ว
    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end
  end
end
