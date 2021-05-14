class CollectedItemsController < ApplicationController
  before_action :set_collected_item, only: %i[ show edit update destroy ]

  # GET /collected_items or /collected_items.json
  def index
    @collected_items = CollectedItem.all
  end

  # GET /collected_items/1 or /collected_items/1.json
  def show
  end

  # GET /collected_items/new
  def new
    @collected_item = CollectedItem.new
  end

  # GET /collected_items/1/edit
  def edit
  end

  # POST /collected_items or /collected_items.json
  def create
    @collected_item = CollectedItem.new(collected_item_params)

    respond_to do |format|
      if @collected_item.save
        format.html { redirect_to @collected_item, notice: "Collected item was successfully created." }
        format.json { render :show, status: :created, location: @collected_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collected_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collected_items/1 or /collected_items/1.json
  def update
    respond_to do |format|
      if @collected_item.update(collected_item_params)
        format.html { redirect_to @collected_item, notice: "Collected item was successfully updated." }
        format.json { render :show, status: :ok, location: @collected_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collected_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collected_items/1 or /collected_items/1.json
  def destroy
    @collected_item.destroy
    respond_to do |format|
      format.html { redirect_to collected_items_url, notice: "Collected item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collected_item
      @collected_item = CollectedItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collected_item_params
      params.require(:collected_item).permit(:product_id, :cart_id)
    end
end
