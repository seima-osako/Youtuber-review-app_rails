class ProductsController < RankingController
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
  end
end
