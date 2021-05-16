class Order < ApplicationRecord
    enum pay_types: {
        "Check" => 0,
        "Credit Card" => 1,
        "Online Merchant" => 2
    }
end
