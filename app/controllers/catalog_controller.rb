class CatalogController < ApplicationController
  skip_before_action :authorize_request
  def index
    @products = Product.all.order(:name)
  end
end
