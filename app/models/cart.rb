class Cart < ApplicationRecord
    has_many :cart_lines, dependent: :destroy
end
