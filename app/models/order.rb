class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items, dependent: :destroy
    enum status: {
    入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4
  }

  
  enum payment: {クレジットカード: 0, 銀行振り込み: 1 }

  attr_accessor :address_a, :order
  validates :total_payment, presence: true
end
