module CurrentCart
    extend ActiveSupport::Concern
    private
    #if no cart exist for a logged session, create one
    def set_cart_as_current_cart
        begin
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound => e
            @cart = Cart.create
            session[:cart_id] = @cart
        end
    end
end