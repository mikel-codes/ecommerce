module CurrentCart
    private
    #if no cart exist for a logged session, create one
    def set_cart_as_current_cart
        begin
            @cart = Cart.find(session[:cart_id])
        rescue ActiveModel::RecordNotFound => e
            @cart = Cart.create
            session[:cart_id] = @cart
        end

    end
end