class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user_id, :product_id, :quantity, :subtotal, :tax, :total, presence: true
  validates :user_id, :product_id, :quantity, numericality: { only_integer: true }
  validates :subtotal, :tax, :total, numericality: true
end
