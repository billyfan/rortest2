class StoreController < ApplicationController
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.all
      @visit_count = increase_visit_count
      @cart = current_cart
    end
  end

  private
    def increase_visit_count
      session[:counter] ||= 0
      session[:counter] += 1
    end
end
