class ReviewsController < RankingController
  before_action :authenticate_user!, only: :new
  
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    review = Review.new(create_params) # この時点では保存されていない
    if review.save
      flash[:notice] = "投稿されました。"
      redirect_to controller: :products, action: :index
    else
      redirect_to new_product_review_path, flash: {
        review: review,
        error_messages: review.errors.full_messages
      }
    end
  end

  private
  def create_params
    params.require(:review).permit(:nickname, :rate, :review).merge(product_id: params[:product_id])
  end
end
