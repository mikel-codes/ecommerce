module CurrentCart
    extend ActiveSupport::Concern
    private
    #if no cart exists in the request sessions,create one
    def set_current_cart
        begin
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
            @cart = Cart.create
            session[:cart_id] = @cart.id
        end
    end
end