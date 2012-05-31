class StoreController < ApplicationController
  def index
    @products = Product.all
    @visit_count = increase_visit_count
    @cart = current_cart
  end

  private
    def increase_visit_count
      session[:counter] ||= 0
      session[:counter] += 1
    end
end
