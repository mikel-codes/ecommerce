class Order < ApplicationRecord
    enum payment_types: {
        "Check" => 0,
        "Credit Card" => 1,
        "Online Merchant" => 2
    }
    validates :name, :email, :address, presence: true
    validates :pay_type, inclusion: payment_types.keys
end
