class ReviewsController < RankingController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    review = Review.create(create_params)
    if review.save
      flash[:notice] = "投稿されました"
      redirect_to controller: :products, action: :index
    else
      redirect_to :back, flash: {
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
