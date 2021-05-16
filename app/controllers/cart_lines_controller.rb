class CartLinesController < ApplicationController
  include CurrentCart
  before_action :set_current_cart, only: [:create, :destroy]
  before_action :set_cart_line, only: %i[ show edit update destroy ]

  # GET /cart_lines or /cart_lines.json
  def index
    @cart_lines = CartLine.all
  end

  # GET /cart_lines/1 or /cart_lines/1.json
  def show
  end

  # GET /cart_lines/new
  def new
    @cart_line = CartLine.new
  end

  # GET /cart_lines/1/edit
  def edit
  end

  # POST /cart_lines or /cart_lines.json
  def create
    product = Product.find(params[:product_id])
    @cart_line = @cart.add_product product

    respond_to do |format|
      if @cart_line.save
        format.html { redirect_to @cart_line.cart, notice: "Product \"#{product.name}\" was successfully added." }
        format.json { render :show, status: :created, location: @cart_line.cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_line.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /cart_lines/1 or /cart_lines/1.json
  def destroy
    @cart_line.destroy
    if @cart.cart_lines.to_a.size > 0
      respond_to do |format|
        format.html { redirect_to @cart_line.cart, notice: "Cart line was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do|f|
        f.html  do
          redirect_to shop_products_url, notice: "cart is invalid and empty"
        end
        f.json { head :no_content}
    end
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_line
      @cart_line = CartLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_line_params
      params.require(:cart_line).permit(:product_id)
    end
end
